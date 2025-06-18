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
            .padding(10)
            .foregroundColor(.black)
            .background(.white)
            .overlay(
                Rectangle()
                    .stroke(Color.gray, lineWidth: 1)
            )
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
    }
}

extension View {
    func textFieldStyle(isRounded: Bool = false) -> some View {
        if isRounded {
            return self
                .padding(10)
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .foregroundColor(.gray)
                .eraseToAnyView()
        } else {
            return self.modifier(TextFieldBorderAndBackground())
                .eraseToAnyView()
        }
    }

    fileprivate func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
