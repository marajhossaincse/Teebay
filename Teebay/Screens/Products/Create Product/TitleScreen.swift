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
            .padding(.bottom, 80)

            NavigationLink(destination: CategoryScreen()) {
                Text("NEXT")
                    .font(.headline)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    TitleScreen()
}
