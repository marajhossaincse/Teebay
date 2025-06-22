//
//  UserLogin.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/22/25.
//

import Foundation

struct UserLoginRequest: Codable {
    let message: String
    let user: UserLoginResponse
}

struct UserLoginResponse: Identifiable, Codable {
    let id: Int
    let email: String
    let firstName: String?
    let lastName: String?
    let address: String?
    let firebaseConsoleManagerToken: String?
    let password: String?
    let dateJoined: String?

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
