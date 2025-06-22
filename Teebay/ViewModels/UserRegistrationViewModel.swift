//
//  UserRegistrationViewModel.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/19/25.
//

import Foundation

@MainActor
class UserRegistrationViewModel: ObservableObject {
   @Published var firstName: String = ""
   @Published var lastName: String = ""
   @Published var address: String = ""
   @Published var email: String = ""
   @Published var password: String = ""
   @Published var confirmPassword: String = ""

    func registerUser() async {
        let user = UserRegistrationRequest(
            email: email,
            firstName: firstName,
            lastName: lastName,
            address: address,
            firebaseConsoleManagerToken: "",
            password: password
        )

        do {
            let result = try await DataSource.request(api: RegistrationAPI.register(user: user), type: UserRegistrationResponse.self)

            print("\(result)")
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
}
