//
//  TitleScreen.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/17/25.
//

import SwiftUI

struct TitleScreen: View {
    @State var title: String = ""

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 20) {
                Text("Select a title for your screen")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)

                TextField("", text: $title)
                    .padding(10)
                    .background(
                        Rectangle()
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .frame(maxWidth: .infinity)
            }
            .padding(.bottom, 60)

            Button {
                // navigate to select category screen
            } label: {
                Text("Next")
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.purple)
            }
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    TitleScreen()
}
