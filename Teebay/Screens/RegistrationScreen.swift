//
//  RegistrationScreen.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/12/25.
//

import SwiftUI

struct RegistrationScreen: View {
    @Environment(\.dismiss) var dismiss
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var address: String = ""
    @State var email: String = ""
    @State var phoneNumber: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State private var showSignInScreen = false
    
    var body: some View {
        VStack(spacing: 28) {
            Spacer()
            
            Text("SIGN UP")
                .font(.title)
            
            TextField("First Name", text: $firstName)
                .textFieldStyle()
                
            TextField("Last Name", text: $lastName)
                .textFieldStyle()
            
            TextField("Address", text: $address)
                .textFieldStyle()
            
            TextField("Email", text: $email)
                .textFieldStyle()
            
            TextField("Phone Number", text: $phoneNumber)
                .textFieldStyle()
            
            SecureField("Password", text: $password)
                .textFieldStyle()
            
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle()
            
            Button {} label: {
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

#Preview {
    RegistrationScreen(
        firstName: "",
        lastName: "",
        address: "",
        email: "",
        phoneNumber: "",
        password: "",
        confirmPassword: ""
    )
}
