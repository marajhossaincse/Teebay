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
        VStack(spacing: 40) {
            Spacer()
            
            Text("SIGN IN")
                .font(.title)
            
            TextField("Email", text: $email)
                .padding(10)
                .background(Color.white)
                .overlay(
                    Rectangle()
                        .stroke(Color.gray, lineWidth: 1)
                )
                .foregroundColor(.gray)
                
            TextField("Password", text: $password)
                .padding(10)
                .background(Color.white)
                .overlay(
                    Rectangle()
                        .stroke(Color.gray, lineWidth: 1)
                )
                .foregroundColor(.gray)
            
            Button {} label: {
                Text("LOGIN")
            }
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            
            Text("Don't have an account? Signup")
    
            Spacer()
        }
        .padding(40)
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen(
            email: "",
            password: ""
        )
    }
}
