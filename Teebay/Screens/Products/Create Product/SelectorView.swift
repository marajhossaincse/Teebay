//
//  SelectorView.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/17/25.
//

import SwiftUI

struct MultiSelectPickerView: View {
    @State private var selectedCategories: Set<Category> = []

    let allCategories: [Category] = [
        Category(name: "ELECTRONICS"),
        Category(name: "FURNITURE"),
        Category(name: "HOME APPLIANCES"),
        Category(name: "SPORTING GOODS"),
        Category(name: "OUTDOOR"),
        Category(name: "TOYS"),
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            MultiSelectPicker(
                selections: $selectedCategories,
                options: allCategories,
                title: "Select Categories",
                placeholder: "Choose categories..."
            )
        }
    }
}

struct MultiSelectPicker<Item: Identifiable & Hashable & CustomStringConvertible>: View {
    @Binding var selections: Set<Item>
    let options: [Item]
    let title: String
    let placeholder: String

    @State private var showingOptions: Bool = false

    var body: some View {
        Button(action: {
            showingOptions.toggle()
        }) {
            HStack {
                Text(selectedItemsText())
                    .foregroundStyle(selections.isEmpty ? Color.gray : Color.primary)

                Spacer()

                Image(systemName: "chevron.down")
                    .rotationEffect(.degrees(showingOptions ? 180 : 0))
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
        .sheet(isPresented: $showingOptions) {
            MultiSelectOptionsView(
                selections: $selections,
                options: options,
                title: title,
                showingOptions: $showingOptions
            )
        }
    }

    private func selectedItemsText() -> String {
        if selections.isEmpty {
            return placeholder
        } else {
            return selections.map { $0.description }.joined(separator: ", ")
        }
    }
}

private struct MultiSelectOptionsView<Item: Identifiable & Hashable & CustomStringConvertible>: View {
    @Binding var selections: Set<Item>
    let options: [Item]
    let title: String
    @Binding var showingOptions: Bool

    var body: some View {
        NavigationView {
            List {
                ForEach(options) { item in
                    Button(action: {
                        toggleSelection(item)
                    }) {
                        HStack {
                            Text(item.description)
                            Spacer()
                            if selections.contains(item) {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(Color.accentColor)
                            }
                        }
                    }
                    .foregroundStyle(Color.primary)
                }
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        showingOptions = false
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        showingOptions = false
                    }
                }
            }
        }
    }

    private func toggleSelection(_ item: Item) {
        if selections.contains(item) {
            selections.remove(item)
        } else {
            selections.insert(item)
        }
    }
}

struct Category: Identifiable, Hashable, CustomStringConvertible {
    let id = UUID()
    let name: String

    var description: String {
        return name
    }
}

#Preview {
    NavigationView {
        MultiSelectPickerView()
    }
}
