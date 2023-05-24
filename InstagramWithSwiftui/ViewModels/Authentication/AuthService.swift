//
//  AuthService.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 23/05/23.
//

import Firebase
import FirebaseFirestoreSwift


class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    static let shared = AuthService()
    
    init(){
       
        Task{
            try? await loadUserData()
        }
    }
    
    func login(withEmail email: String,password : String) async throws{
        do{
            let results = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = results.user
            try? await loadUserData()
        }
        catch{
            print("DEBUG: Failed to sign in User \(error.localizedDescription)")
        }

    }
    
    func createUser(email: String,password: String,userName: String) async throws {
        do{
            let results = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = results.user
            await uploadUserData(uid: results.user.uid,email: email,userName: userName)
        }
        catch{
            print("DEBUG: Failed to create User \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        
        guard let currentUid = userSession?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        print("\(String(describing: snapshot.data()))")
        currentUser = try? snapshot.data(as: User.self)
    }
    
    private func uploadUserData(uid: String,email: String, userName: String) async {
        
        let user = User(id: uid, userName: userName, email: email)
        currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
    
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
        currentUser = nil
    }
    
}
