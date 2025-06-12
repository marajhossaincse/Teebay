//
//  BiometricItem.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/12/25.
//

import LocalAuthentication
import SwiftUI

struct BiometricItem: View {
    @StateObject private var authenticator = BiometricAuthenticator()

    @State private var showingLoginSuccessAlert = false
    @State private var showingLoginFailureAlert = false

    var body: some View {
        VStack(spacing: 20) {
            Button {
                authenticator.authenticate()
            } label: {
                Image(systemName: authenticator.canEvaluatePolicy() ? "touchid" : "xmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(authenticator.canEvaluatePolicy() ? .accentColor : .red)
            }
            .disabled(!authenticator.canEvaluatePolicy())

            Text(authenticator.canEvaluatePolicy() ?
                "Tap to log in with Biometrics." :
                "Biometrics not available.")

            if let error = authenticator.authenticationError {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
        .onChange(of: authenticator.isAuthenticated) { newValue in
            if newValue {
                showingLoginSuccessAlert = true
            }
        }
        .onChange(of: authenticator.authenticationError) { newValue in
            if newValue != nil { // If there's a new error
                showingLoginFailureAlert = true
            }
        }
        .alert("Login Successful", isPresented: $showingLoginSuccessAlert) {
            Button("OK") {
                // Perform post-login actions (e.g., navigate to home screen)
                print("User is logged in!")
            }
        } message: {
            Text("You have successfully logged in using biometrics.")
        }
        .alert("Login Failed", isPresented: $showingLoginFailureAlert) {
            Button("OK") {
                authenticator.resetContext() // Allow retrying after dismissing error
            }
        } message: {
            Text(authenticator.authenticationError ?? "An unknown error occurred.")
        }
    }
}

#Preview {
    BiometricItem()
}
