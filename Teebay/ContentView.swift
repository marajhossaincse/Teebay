//
//  ContentView.swift
//  Teebay
//
//  Created by Maraj Hossain on 11/6/25.
//

import FirebaseAuth
import SwiftUI

struct ContentView: View {
    @StateObject private var userSessionManager = UserSessionManager()

    var body: some View {
        NavigationStack{
            Group {
                if userSessionManager.isLoggedIn {
                    AllProductsScreen()
                } else {
                    LoginScreen(userSessionManager: userSessionManager)
                }
            }
            .environmentObject(userSessionManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
