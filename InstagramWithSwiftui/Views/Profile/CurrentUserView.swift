//
//  CurrentUserView.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 19/05/23.
//

import SwiftUI

struct CurrentUserView: View {
    private let gridItems : [GridItem] = [
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1)
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    VStack(spacing: 10){
                        HStack{
                            Image("lugia")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                Spacer()
                            HStack{
                                Spacer()
                                UsersStatView(value: 3, title: "Posts")
                                Spacer()
                                UsersStatView(value: 10, title: "Followers")
                                Spacer()
                                UsersStatView(value: 130, title: "Following")
                                Spacer()
                            }
                        }
                        .padding(.horizontal)
                        VStack(alignment: .leading,spacing: 4){
                           Text("Balakrishnan")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text("Wakanda forever")
                                .font(.footnote)
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.horizontal)
                        Button {
                            
                        } label: {
                            Text("Edit Profile")
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .frame(width: 400, height: 32)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color.gray,lineWidth: 1)
                                }
                                
                        }
                        Divider()
                    }
                    
                    LazyVGrid(columns: gridItems,spacing: 1) {
                        
                        ForEach(1 ... 40, id: \.self) { _ in
                            Image("gojo")
                                .resizable()
                                .scaledToFit()
                        }
                        
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }

                }
            }
        }
    }
}

struct CurrentUserView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserView()
    }
}
