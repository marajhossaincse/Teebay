//
//  RegistrationAPI.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/19/25.
//

import Foundation

enum RegistrationAPI: API {
    case register(user: UserRegistrationRequest)

    private var localUrl: String {
        switch self {
        case .register:
            return "/api/users/register/"
        }
    }

    var url: String {
        "\(baseUrl)\(localUrl)"
    }

    var httpBody: Encodable? {
        switch self {
        case .register(let user):
            return user
        }
    }

    var httpMethod: HttpMethod {
        switch self {
        case .register: .post
        }
    }
}
