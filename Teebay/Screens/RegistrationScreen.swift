//
//  RegistrationScreen.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/12/25.
//

import SwiftUI

// add logic for matching passwords
// keep submit button disabled until all fields are not filled
// validate email

struct RegistrationScreen: View {
    @Environment(\.dismiss) var dismiss

    @State private var viewModel: UserRegistrationViewModel = .init()
    
    var body: some View {
        VStack(spacing: 28) {
            Spacer()
            
            Text("SIGN UP")
                .font(.title)
            
            TextField("First Name", text: $viewModel.firstName)
                .textFieldStyle()
                
            TextField("Last Name", text: $viewModel.lastName)
                .textFieldStyle()
            
            TextField("Address", text: $viewModel.address)
                .textFieldStyle()
            
            TextField("Email", text: $viewModel.email)
                .textFieldStyle()
                        
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle()
            
            SecureField("Confirm Password", text: $viewModel.confirmPassword)
                .textFieldStyle()
            
            Button {
                Task {
                    await viewModel.registerUser()
                    print("Debug button hit")
                }
            } label: {
                Text("REGISTER")
            }
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            
            HStack {
                Text("Already have an account?")
             
                Button {
                    dismiss()
                } label: {
                    Text("Sign In")
                }
            }
    
            Spacer()
        }
        .padding(.horizontal, 40)
        .navigationBarBackButtonHidden()
    }
}

// #Preview {
//    RegistrationScreen()
// }
