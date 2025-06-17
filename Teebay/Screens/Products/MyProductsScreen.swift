//
//  MyProductsScreen.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/17/25.
//

import SwiftUI

struct MyProductsScreen: View {
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                VStack(spacing: 8) {
                    ProductCard()

                    ProductCard()

                    Spacer()
                }
                .padding(.bottom, 60)

                Button {
                    // navigate to create product screen
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .padding()
            }
        }
        .navigationTitle("MY PRODUCTS")
    }
}

#Preview {
    NavigationStack {
        MyProductsScreen()
    }
}
