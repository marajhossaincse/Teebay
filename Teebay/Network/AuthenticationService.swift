//
//  AuthenticationService.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/22/25.
//

import FirebaseAuth
import Foundation

enum AuthenticationError: Error, LocalizedError {
    case firebaseError(Error)
    case apiError(Error)
    case invalidResponse
    case unknown

    var errorDescription: String? {
        switch self {
        case .firebaseError(let error):
            return "Firebase Error: \(error.localizedDescription)"
        case .apiError(let error):
            return "API Error: \(error.localizedDescription)"
        case .invalidResponse:
            return "Invalid response from server."
        case .unknown:
            return "An unknown authentication error occurred."
        }
    }
}

class AuthenticationService {
    // MARK: - Firebase Registration

//    func registerUser(email: String, password: String) async throws {
//        do {
//            let result = try await Auth.auth().createUser(withEmail: email, password: password)
//            print("Firebase registration successful: User ID \(result.user.uid)")
//            // Here you could also save additional user data to Firestore if needed
//        } catch {
//            print("Firebase registration failed: \(error.localizedDescription)")
//            throw AuthenticationError.firebaseError(error)
//        }
//    }

    // MARK: - Custom Backend Login

    func loginUser(email: String, password: String) async throws -> UserLoginResponse {
        do {
            let requestBody: [String: String] = ["email": email, "password": password]
            let loginUserRequest = try LoginAPI.login(email: email, password: password)

            let backendResponse = try await DataSource.request(api: loginUserRequest, type: UserLoginRequest.self)

            guard let user = backendResponse.user as? UserLoginResponse else {
                throw AuthenticationError.invalidResponse
            }
            print("Backend login successful for user: \(user.email)")
            return user
        } catch let urlError as URLError {
            print("Network Error during login: \(urlError.localizedDescription)")
            throw AuthenticationError.apiError(urlError)
        } catch let decodingError as DecodingError {
            print("Decoding Error during login: \(decodingError.localizedDescription)")
            throw AuthenticationError.apiError(decodingError)
        } catch {
            print("An unexpected error occurred during backend login: \(error.localizedDescription)")
            throw AuthenticationError.apiError(error)
        }
    }

    // MARK: - Firebase Logout

    func logoutUser() throws {
        do {
            try Auth.auth().signOut()
            print("User logged out from Firebase.")
        } catch {
            print("Error signing out from Firebase: \(error.localizedDescription)")
            throw AuthenticationError.firebaseError(error)
        }
    }

    // MARK: - Get Current Firebase User

    func getCurrentFirebaseUser() -> User? {
        return Auth.auth().currentUser
    }
}
