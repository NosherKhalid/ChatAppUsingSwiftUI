//
//  SignInView.swift
//  ChatAppUsingSwiftUI
//
//  Created by Nosher Khalid on 23/07/2022.
//

import SwiftUI

struct SignInView: View {
    @State private var username: String = ""
    @State private var password: String  = ""
    @State private var activeState: Bool = false
    
    var firebaseManager = FirebaseManager()
    var body: some View {
        ZStack {
            Color("AppBackground")
            NavigationView {
                VStack(spacing: 20) {
                    TextField(text: $username) {
                        Text("Enter Email:")
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    .foregroundColor(.black)
                    TextField(text: $password) {
                        Text("Enter Password:")
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    .foregroundColor(.black)
                    
                    VStack {
                        NavigationLink(isActive: $activeState) {
                            ChatBoxView(firebaseManager: firebaseManager)
                        } label: {}
                        Button {
                            signInUser()
                        } label: {
                            Text("Go to Chat Box")
                                .frame(width: 250, height: 50, alignment: .center)
                                .foregroundColor(.white)
                                .background(Color.purple)
                                .cornerRadius(5)
                        }
                        .onTapGesture {
                            signInUser()
                        }
                    }
                }
            }
            .navigationViewStyle(.stack)
        }
    }
    
    func signInUser(){
        firebaseManager.signInUser(userName: username, password: password) { state in
            if state {
                activeState = true
            } else {
                activeState = false
                debugPrint("Do Nothing")
            }
        }
    }
}
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .preferredColorScheme(.dark)
    }
}
