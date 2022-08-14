//
//  ChatUser.swift
//  ChatAppUsingSwiftUI
//
//  Created by Nosher Khalid on 09/08/2022.
//

import Foundation

struct ChatUser: Identifiable {
    var id: ObjectIdentifier
    var messages: String? = ""
    var name: String? = ""
    var senderID: String? = ""
    var timeStamp: String? = ""
}
