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
        Group {
            if userSessionManager.isLoggedIn {
                // Main App Content:
                // access `userSessionManager.currentUser` here to display user-specific data.
                VStack {
                    Text("Welcome, \(userSessionManager.currentUser?.firstName ?? userSessionManager.currentUser?.email ?? "User")!")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding()
                        .foregroundColor(.purple)

                    Spacer()

                    Text("This is your main app content!")
                        .font(.title2)
                        .foregroundColor(.gray)

                    Spacer()

                    Button("Logout") {
                        Task {
                            do {
                                // Logout Logic:
                                try AuthenticationService().logoutUser()
                                userSessionManager.clearUserSession()

                            } catch {
                                print("Logout error: \(error.localizedDescription)")
                                // TODO: Show an alert to the user if logout fails unexpectedly
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
            } else {
                // Authentication Flow:
                // If not logged in, present the LoginView.
                LoginScreen(userSessionManager: userSessionManager)
            }
        }
        // EnvironmentObject Propagation:
        .environmentObject(userSessionManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
