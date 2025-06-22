//
//  LoginViewModel.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/22/25.
//

import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage: String? = nil
    @Published var isLoading = false

    private let authService: AuthenticationService
    private let userSessionManager: UserSessionManager

    init(authService: AuthenticationService = AuthenticationService(),
         userSessionManager: UserSessionManager)
    {
        self.authService = authService
        self.userSessionManager = userSessionManager
    }

    func login() async {
        isLoading = true
        errorMessage = nil

        do {
            let loggedInUser = try await authService.loginUser(email: email, password: password)
            userSessionManager.setUserSession(user: loggedInUser) // Store the user in session manager
            print("Login successful for user: \(loggedInUser.email)")
        } catch let authError as AuthenticationError {
            errorMessage = authError.localizedDescription
            print("Login failed: \(authError.localizedDescription)")
        } catch {
            errorMessage = "An unexpected error occurred during login."
            print("Login failed with unknown error: \(error.localizedDescription)")
        }
        isLoading = false
    }
}
