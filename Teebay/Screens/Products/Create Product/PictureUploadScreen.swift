//
//  PictureUploadScreen.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/17/25.
//

import SwiftUI

struct PictureUploadScreen: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
//        ZStack(alignment: .bottomTrailing) {
            VStack {
                Button {} label: {
                    Text("Take Picture using Camera")
                        .font(.headline)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                }

                Button {} label: {
                    Text("Upload Picture from Device")
                        .font(.headline)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                }
            }
//            .padding(.bottom, 80)

            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("BACK")
                        .font(.headline)
                        .padding()
                        .foregroundStyle(.white)
                        .background(.purple)
                }

                Spacer()

                NavigationLink(destination: DescriptionScreen()) {
                    Text("NEXT")
                        .font(.headline)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                }
            }
            .padding()
//        }
//        .padding(.horizontal, 40)
    }
}

#Preview {
    PictureUploadScreen()
}
