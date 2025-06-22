//
//  User.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/19/25.
//

import Foundation

struct UserSubmit: Codable {
    var email: String
    var firstName: String
    var lastName: String
    var address: String
    var firebaseConsoleManagerToken: String
    var password: String

    init(
        email: String,
        firstName: String,
        lastName: String,
        address: String,
        firebaseConsoleManagerToken: String,
        password: String
    ) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.firebaseConsoleManagerToken = firebaseConsoleManagerToken
        self.password = password
    }

    enum CodingKeys: String, CodingKey {
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case address
        case firebaseConsoleManagerToken = "firebase_console_manager_token"
        case password
    }
}

struct UserResponse: Identifiable, Codable {
    let id: Int
    var email: String
    var firstName: String
    var lastName: String
    var address: String
    var firebaseConsoleManagerToken: String
    var password: String
    var dateJoined: String

    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case address
        case firebaseConsoleManagerToken = "firebase_console_manager_token"
        case password
        case dateJoined = "date_joined"
    }
}
