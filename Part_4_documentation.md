# Technical Documentation: Teebay iOS Application

**Version**: 1.0.0
**Date**: June 22, 2025
**Author(s)**: Maraj Hossain

## Introduction

### Purpose and Scope
    This document provides a comprehensive technical overview of Teebay. It details the app's architecture, key components, development environment, and deployment processes, serving as a guide for developers, QA engineers, and other stakeholders involved in the project.

### Target Audience
    - iOS Developers
    - Quality Assurance (QA) Engineers
    - Backend Developers
    - Project Managers / Product Owners

### Key Features
    - User Authentication
    - User Session Management
    - User Registration
    - Product Addition
    - Product Listing

## Architecture Overview

### Architectural Pattern
Teebay adheres to the MVVM (Model-View-ViewModel) architectural pattern.

- **Model:** Represents the data and business logic. This includes data structures.
- **View:** The SwiftUI UI layer responsible solely for presenting information and capturing user input. Views observe changes in their corresponding ViewModels.
- **ViewModel:** Acts as an intermediary between the Model and the View. It prepares data for the View, handles user interactions, performs validation, and orchestrates calls to the Model layer. ViewModels expose @Published properties that the Views observe.

This separation of concerns promotes testability, maintainability, and reusability of components. 

## Development Environment

### Required Software
- **Xcode:** Version 16.2 or newer.
- **macOS:** Version 15.5 or newer.
- **Swift:** Version 5.9 or newer.
- **Git:** For version control

### Dependencies/Frameworks
UI Framework: Swiftui

All dependencies are managed via Swift Package Manager (SPM).
- Firebase SDKs:
- Firebase/Auth: For email/password authentication.
- Firebase/Core: Core Firebase functionalities.

## Features List
- User registration
- User login
- Biometric login functionality
- Product addition
- Product editing
- Product deletion
- Product renting
- Product selling
- Product buying 
    
### Authentication Module
This module handles all aspects of user authentication, acting as the gateway to the application's features.

User Login
- Flow: User enters email and password.

Login view captures inputs and binds to LoginViewModel. The LoginViewModel performs client-side validation. The LoginViewModel call the login function from the Authentication Service. This constructs the login request and calls to hit the custom backend API. The backend responds to the request. The Authentication Service extracts and returns the login response. 

User Session Management
The UserSessionManager is a central, observable object that manages the app's authentication state. It features a currentUser property (holding LoginUserResponse data from the backend) and an isLoggedIn property, which indicates if a user is currently active. The manager listens for Firebase authentication changes and provides methods to setUserSession() and clearUserSession(). The ContentView observes UserSessionManager.isLoggedIn to conditionally display either the LoginView (as a full-screen cover) or the main app content.

API Definitions
- API Protocol: Defines the contract for all API endpoints (url, httpMethod, httpBody).
- HttpMethod Enum: Defines standard HTTP methods (GET, POST, DELETE, PATCH).
- APIEndpoint Enum: Holds the base URL for the backend API.
- AuthAPI Enum: Concrete implementation of API protocol for authentication-related endpoints (.login, .register). It handles the construction of the request body specific to each endpoint.

NetworkManager 
- DataSource Enum: Contains a static request method.
- Takes an API conforming enum case and the expected Decodable response type.
- Constructs URLRequest including httpMethod and httpBody (JSON encoded).
- Sets standard headers (Content-Type: application/json, Accept: application/json).
- Performs URLSession.shared.data(for: request).
- Validates HTTP status codes (200-299 for success).
- Decodes the response data into the specified type.
- Throws URLError for network or HTTP status errors.
    
Biometric Authentication
- isAuthenticated: A published boolean indicating the current authentication status.
- authenticationError: A published optional string that stores detailed error messages if authentication fails.
- canEvaluatePolicy(): Checks if the device supports biometric authentication and if biometrics are configured. You can use this to enable or disable the biometric login option in your UI.
- authenticate(): Initiates the biometric authentication process, prompting the user with a "Log in to your account" message. It handles various LAError cases, providing specific error messages for scenarios like user cancellation, lockout, or unenrollment.
- resetContext(): Resets the authentication state, clearing any previous errors and setting isAuthenticated to false. This is useful for allowing users to retry authentication after a failure.
