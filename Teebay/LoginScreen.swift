//
//  LoginScreen.swift
//  Teebay
//
//  Created by Maraj Hossain on 11/6/25.
//

import SwiftUI

struct LoginScreen: View {
    @State var email: String = ""
    @State var password: String = ""
    @State private var showRegistrationScreen = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 28) {
                Spacer()
                
                Text("SIGN IN")
                    .font(.title)
                
                TextField("Email", text: $email)
                    .textFieldStyle()
                    
                TextField("Password", text: $password)
                    .textFieldStyle()
                
                Button {} label: {
                    Text("LOGIN")
                }
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                
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
    LoginScreen(
        email: "",
        password: ""
    )
}
