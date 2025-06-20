//
//  UserRegistrationViewModel.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/19/25.
//

import Foundation

@MainActor
@Observable
class UserRegistrationViewModel {
    var firstName: String = "Lorem"
    var lastName: String = "Lorem"
    var address: String = "Lorem"
    var email: String = "Lorem@somemail.com"
    var password: String = "Lorem"
    var confirmPassword: String = "Lorem"

    func registerUser() async {
        print("debug in register user function")
        let user = UserSubmit(
            email: email,
            firstName: firstName,
            lastName: lastName,
            address: address,
            firebaseConsoleManagerToken: "",
            password: password
        )

        do {
            print("debug do")
            let result = try await DataSource.request(api: RegistrationAPI.register(user: user), type: UserResponse.self)

            print("\(result)")
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
}
