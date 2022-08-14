//
//  ChatBox.swift
//  ChatAppUsingSwiftUI
//
//  Created by Nosher Khalid on 23/07/2022.
//

import SwiftUI
import FirebaseFirestore

struct ChatBoxView: View {
    let firebaseManager: FirebaseManager!
    var chatUsersList = [ChatUser]()
    var body: some View {
        ZStack{
            Color("AppBackground")
            List {
                Text("Person1")
                Text("Person1")
                Text("Person1")
                Text("Person1")
                Text("Person1")
                Text("Person1")
            }
            .navigationTitle("Chat Box")
            .tint(Color("AppBackground"))
        }
        .onAppear {
            firebaseManager.fetchUsersList()
        }
    }
}

struct ChatBox_Previews: PreviewProvider {
    static var previews: some View {
        ChatBoxView(firebaseManager: .none)
    }
}
