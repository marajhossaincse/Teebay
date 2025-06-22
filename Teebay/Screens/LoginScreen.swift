//
//  LoginScreen.swift
//  Teebay
//
//  Created by Maraj Hossain on 11/6/25.
//

import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var userSessionManager: UserSessionManager
    @StateObject private var viewModel: LoginViewModel
    @State private var showRegistrationScreen = false
    
    init(
        userSessionManager: UserSessionManager
    ) {
        _viewModel = StateObject(wrappedValue: LoginViewModel(userSessionManager: userSessionManager))
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 28) {
                Spacer()
                
                Text("SIGN IN")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 40)
                    .foregroundColor(.purple)
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle()
                    
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle()
                
                Button {
                    Task {
                        await viewModel.login()
                    }
                } label: {
                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.purple.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    } else {
                        Text("Login")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .disabled(viewModel.isLoading)
                
                BiometricItem()
                
                HStack {
                    Text("Don't have an account?")
                    
                    Button {
                        showRegistrationScreen = true
                    } label: {
                        Text("Sign Up")
                    }
                }
        
                Spacer()
            }
            .padding(.horizontal, 40)
            .navigationDestination(isPresented: $showRegistrationScreen) {
                RegistrationScreen()
            }
        }
    }
}

#Preview {
    LoginScreen(userSessionManager: UserSessionManager())
}
