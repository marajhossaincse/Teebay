//
//  TitleScreen.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/17/25.
//

import SwiftUI

struct TitleScreen: View {
    @State private var viewModel: ProductCreationViewModel = .init()

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 20) {
                Text("Select a title for your screen")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)

                TextField("", text: $viewModel.title)
                    .textFieldStyle()
            }
            .padding(.bottom, 80)

            NavigationLink(destination: CategoryScreen(viewModel: viewModel)) {
                CustomButtonView(name: "NEXT")
            }
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    TitleScreen()
}
