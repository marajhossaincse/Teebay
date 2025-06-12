//
//  RegistrationScreen.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/12/25.
//

import SwiftUI

struct RegistrationScreen: View {
    @State var firstName: String
    @State var lastName: String
    @State var address: String
    @State var email: String
    @State var phoneNumber: String
    @State var password: String
    @State var confirmPassword: String
    
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
            
            TextField("Password", text: $password)
                .textFieldStyle()
            
            TextField("Confirm Password", text: $confirmPassword)
                .textFieldStyle()
            
            Button {} label: {
                Text("REGISTER")
            }
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            
            Text("Already have an account? Sign In")
    
            Spacer()
        }
        .padding(.horizontal, 40)
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
