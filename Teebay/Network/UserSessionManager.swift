//
//  UserSessionManager.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/22/25.
//

import FirebaseAuth
import Foundation

class UserSessionManager: ObservableObject {
    @Published var currentUser: UserLoginResponse? = nil
    @Published var isLoggedIn: Bool = false

    private var authStateDidChangeListenerHandle: AuthStateDidChangeListenerHandle?

    init() {
        // Observe Firebase auth state changes
        authStateDidChangeListenerHandle = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.isLoggedIn = (user != nil)
                if user == nil {
                    // If Firebase user logs out, clear our custom backend user too
                    self?.currentUser = nil
                }
            }
        }
    }

    deinit {
        if let handle = authStateDidChangeListenerHandle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }

    func setUserSession(user: UserLoginResponse) {
        DispatchQueue.main.async {
            self.currentUser = user
            self.isLoggedIn = true // Set isLoggedIn to true when custom user is set
        }
    }

    func clearUserSession() {
        DispatchQueue.main.async {
            self.currentUser = nil
            self.isLoggedIn = false
        }
    }
}
