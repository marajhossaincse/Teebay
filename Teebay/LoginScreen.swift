//
//  LoginScreen.swift
//  Teebay
//
//  Created by Maraj Hossain on 11/6/25.
//

import SwiftUI

struct LoginScreen: View {
    @State var email: String
    @State var password: String
    
    var body: some View {
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
            
            Text("Don't have an account? Signup")
    
            Spacer()
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    LoginScreen(
        email: "",
        password: ""
    )
}
