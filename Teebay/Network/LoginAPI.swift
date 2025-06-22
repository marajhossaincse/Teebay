//
//  LoginAPI.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/22/25.
//

import Foundation

enum LoginAPI: API {
    case login(email: String, password: String)

    private var localUrl: String {
        switch self {
        case .login:
            return "/api/users/login/"
        }
    }

    var url: String {
        "\(baseUrl)\(localUrl)"
    }

    var httpBody: Encodable? {
        switch self {
        case .login(let email, let password):
            let loginRequest = ["email": email, "password": password]
            return loginRequest
        }
    }

    var httpMethod: HttpMethod {
        switch self {
        case .login: .post
        }
    }
}
