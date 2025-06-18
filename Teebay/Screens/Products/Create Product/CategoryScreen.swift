//
//  CategoryScreen.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/17/25.
//

import SwiftUI

struct CategoryScreen: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                Text("Select categories")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)

                MultiSelectPickerView()
            }
            .padding(.bottom, 80)

            HStack {
                Button {
                    dismiss()
                } label: {
                    CustomButtonView(name: "BACK")
                }

                Spacer()

                NavigationLink(destination: DescriptionScreen()) {
                    CustomButtonView(name: "NEXT")
                }
            }
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    CategoryScreen()
}
