//
//  BiometricAuthenticator.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/12/25.
//

import Foundation
import LocalAuthentication

class BiometricAuthenticator: ObservableObject {
    @Published var isAuthenticated = false // True if the user is authenticated
    @Published var authenticationError: String? = nil // Store any authentication errors

    private var context = LAContext() // The Local Authentication context

    init() {
        // Evaluate policy upon initialization if needed, or on demand
        // For a login screen, you usually evaluate it when the user taps a button.
    }

    func canEvaluatePolicy() -> Bool {
        // Check if the device supports biometric authentication
        // and if there are enrolled biometrics.
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
    }

    func authenticate() {
        guard canEvaluatePolicy() else {
            authenticationError = "Biometric authentication not available or not configured."
            isAuthenticated = false
            return
        }

        let reason = "Log in to your account" // Reason displayed to the user

        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
            DispatchQueue.main.async { // Ensure UI updates on the main thread
                if success {
                    self.isAuthenticated = true
                    self.authenticationError = nil
                    print("Biometric authentication successful!")
                } else {
                    self.isAuthenticated = false
                    if let error = error as? LAError {
                        switch error.code {
                        case .userCancel:
                            self.authenticationError = "Authentication cancelled by user."
                        case .userFallback:
                            self.authenticationError = "User chose to enter password."
                        case .appCancel:
                            self.authenticationError = "Authentication cancelled by app."
                        case .systemCancel:
                            self.authenticationError = "Authentication cancelled by system."
                        case .biometryNotAvailable:
                            self.authenticationError = "Biometry not available on this device."
                        case .biometryNotEnrolled:
                            self.authenticationError = "Biometry not set up. Please enroll Face ID/Touch ID in settings."
                        case .biometryLockout:
                            self.authenticationError = "Biometry locked out. Too many failed attempts. Use passcode."
                        case .authenticationFailed:
                            self.authenticationError = "Authentication failed. Please try again."
                        default:
                            self.authenticationError = "An unknown authentication error occurred."
                        }
                    } else {
                        self.authenticationError = "Unknown error: \(error?.localizedDescription ?? "N/A")"
                    }
                    print("Biometric authentication failed: \(self.authenticationError ?? "Unknown error")")
                }
            }
        }
    }

    /// You might want to reset the context for subsequent authentications
    func resetContext() {
        context = LAContext()
        isAuthenticated = false
        authenticationError = nil
    }
}
