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
        VStack(spacing: 32) {
            Spacer()
            
            Button {} label: {
                Text("Take Picture using Camera")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(8)
            }
            
            Button {} label: {
                Text("Upload Picture from Device")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(8)
            }
            .padding(.bottom, 40)
            
            Spacer()
            
            HStack {
                Button {
                    dismiss()
                } label: {
                    CustomButtonView(name: "BACK")
                }
                
                Spacer()
                
                NavigationLink(destination: PriceScreen()) {
                    CustomButtonView(name: "NEXT")
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    PictureUploadScreen()
}
