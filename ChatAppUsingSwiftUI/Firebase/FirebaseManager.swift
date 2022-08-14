//
//  FirebaseManager.swift
//  ChatAppUsingSwiftUI
//
//  Created by Nosher Khalid on 23/07/2022.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class FirebaseManager {
    
    let dbRef = Firestore.firestore()
    
    func createUser(userName: String, password: String){
        Auth.auth().createUser(withEmail: userName, password: password) { dataResult, error in
            if error == nil {
                switch dataResult {
                case .none:
                    print("User could not be created")
                    
                case .some(let result):
                    print("User is created")
                    debugPrint(result)
                }
            } else {
                print("Error creating user in firebase \(error?.localizedDescription ?? "")")
            }
        }
    }
    
    func signInUser(userName: String, password: String, completion: ((Bool) -> ())?) {
        Auth.auth().signIn(withEmail: userName, password: password) { [weak self] authResult, error in
            guard let _ = self else {return}
            if error != nil {
                debugPrint("\(String(describing: error?.localizedDescription))")
            } else {
                if authResult?.user.uid != nil {
                    debugPrint("User has signed in")
                    completion?(true)
                } else {
                    debugPrint("Error in letting user sign in")
                    completion?(false)
                }
            }
        }
    }
    
    func fetchUsersList(){
        dbRef.collection("Users").getDocuments { querySnapshot, error in
            if let error = error {
                print("Error in fetching users list \(error.localizedDescription)")
            } else {
                for document in querySnapshot!.documents{
                    print("Document ID is : \(document.documentID) => Document Data: \(document.data())")
                }
            }
        }
    }
}
