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
            
            TextField("Password", text: $password)
            
            Button {} label: {
                Text("LOGIN")
                    
            }
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
