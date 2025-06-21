//
//  DescriptionScreen.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/17/25.
//

import SwiftUI

struct DescriptionScreen: View {
    @Environment(\.dismiss) var dismiss

    @Bindable var viewModel: ProductCreationViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Select Description")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)

            TextEditor(text: $viewModel.description)
                .frame(height: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1.5)
                )
                .padding(.vertical)

            HStack {
                Button {
                    dismiss()
                } label: {
                    CustomButtonView(name: "BACK")
                }

                Spacer()

                NavigationLink(destination: PictureUploadScreen(viewModel: viewModel)) {
                    CustomButtonView(name: "NEXT")
                }
            }
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    DescriptionScreen(viewModel: ProductCreationViewModel())
}
