//
//  PictureUploadScreen.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/17/25.
//

import SwiftUI
import UIKit

struct PictureUploadScreen: View {
    @Environment(\.dismiss) var dismiss

    @Bindable var viewModel: ProductCreationViewModel

    // MARK: - State Variables for Image Picking

    @State private var showingImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage? 

    var body: some View {
        VStack(spacing: 32) {
            Spacer()

            // MARK: - Display Selected Image (Optional)

            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
                    .padding(.bottom, 20)
            } else {
                Text("No image selected yet.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
            }

            // MARK: - Take Picture Button

            Button {
                self.sourceType = .camera
                self.showingImagePicker = true
            } label: {
                Text("Take Picture using Camera")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(8)
            }
            .disabled(!UIImagePickerController.isSourceTypeAvailable(.camera)) // Disable if camera is not available

            // MARK: - Upload Picture Button

            Button {
                self.sourceType = .photoLibrary
                self.showingImagePicker = true
            } label: {
                Text("Upload Picture from Device")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(8)
            }
            .padding(.bottom, 40)

            Spacer()

            // MARK: - Navigation Buttons

            HStack {
                Button {
                    dismiss()
                } label: {
                    CustomButtonView(name: "BACK")
                }

                Spacer()

                NavigationLink(destination: PriceScreen(viewModel: viewModel)) {
                    CustomButtonView(name: "NEXT")
                }
                .disabled(selectedImage == nil)
            }
            .padding(.horizontal, 40)

            Spacer()
        }
        .padding(.horizontal, 40)

        // MARK: - Present Image Picker Sheet

        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(sourceType: self.sourceType, selectedImage: $selectedImage)
        }
    }
}

#Preview {
    NavigationView {
        PictureUploadScreen(viewModel: ProductCreationViewModel())
    }
}
