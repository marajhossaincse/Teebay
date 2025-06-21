//
//  CategoryScreen.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/17/25.
//

import SwiftUI

struct CategoryScreen: View {
    @Environment(\.dismiss) var dismiss

    @Bindable var viewModel: ProductCreationViewModel

    @State private var selectedCategoriesForPicker: Set<Category> = []

    let allCategories: [Category] = [
        Category(name: "ELECTRONICS"),
        Category(name: "FURNITURE"),
        Category(name: "HOME APPLIANCES"),
        Category(name: "SPORTING GOODS"),
        Category(name: "OUTDOOR"),
        Category(name: "TOYS"),
    ]

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                Text("Select categories")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)

                MultiSelectPicker(
                    selections: $selectedCategoriesForPicker, // Bind to local @State
                    options: allCategories,
                    title: "Select Categories",
                    placeholder: "Choose categories..."
                )
            }
            .padding(.bottom, 80)

            HStack {
                Button {
                    dismiss()
                } label: {
                    CustomButtonView(name: "BACK")
                }

                Spacer()

                NavigationLink(destination: DescriptionScreen(viewModel: viewModel)) {
                    CustomButtonView(name: "NEXT")
                }
            }
        }
        .padding(.horizontal, 40)
        .onAppear {
            selectedCategoriesForPicker = Set(allCategories.filter { category in
                viewModel.categories.contains(category.name)
            })
        }
        .onDisappear {
            viewModel.categories = selectedCategoriesForPicker.map { $0.name }.sorted()
        }
    }
}

#Preview {
    CategoryScreen(viewModel: ProductCreationViewModel())
}
