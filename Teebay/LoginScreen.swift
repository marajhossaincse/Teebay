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
        VStack{
            Text("SIGN IN")
            
            Spacer()
            
            TextField("Email", text: $email)
                .padding()
                
            TextField("Password", text: $password)
                .padding()
            
            Button {} label: {
                Text("LOGIN")
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(20)
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen(
            email: "Lorem Ipsum",
            password: "Ipsum"
        )
    }
}
