//
//  ContentViewModel.swift6*//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 23/05/23.
//

import Firebase
import Combine

class ContentViewModel: ObservableObject {
    private let service = AuthService.shared
    
    @Published var userSession: FirebaseAuth.User?
    @Published var Currentuser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    
    func setupSubscribers() {
        service.$userSession.sink { [weak self] userSession in
            DispatchQueue.main.async {
                self?.userSession = userSession
            }
        }
        .store(in: &cancellables)
        
       
        service.$currentUser.sink { [weak self] currentuser in
            self?.Currentuser = currentuser
        }
        .store(in: &cancellables)
    }
}
