//
//  CustomTextFieldModifier.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/12/25.
//

import SwiftUI

struct TextFieldBorderAndBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10) // Internal padding for the text
            .background(Color.white) // White background
            .overlay(
                Rectangle() // Use Rectangle for a sharp border
                    .stroke(Color.gray, lineWidth: 1) // Thin grey border
            )
            .foregroundColor(.gray) // Text color set to gray
    }
}

// MARK: - Convenience Extension

extension View {
    func textFieldStyle(isRounded: Bool = false) -> some View {
        if isRounded {
            return self
                .padding(10)
                .background(Color.white)
                .cornerRadius(8) // Apply cornerRadius to the background
                .overlay(
                    RoundedRectangle(cornerRadius: 8) // Match cornerRadius for the border
                        .stroke(Color.gray, lineWidth: 1)
                )
                .foregroundColor(.gray)
                .eraseToAnyView() // Helper to return AnyView for conditional modifiers
        } else {
            return self.modifier(TextFieldBorderAndBackground())
                .eraseToAnyView() // Helper to return AnyView for conditional modifiers
        }
    }

    /// Helper to erase to AnyView for conditional modifiers
    fileprivate func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
