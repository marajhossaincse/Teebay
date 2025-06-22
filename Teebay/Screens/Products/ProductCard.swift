//
//  ProductCard.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/17/25.
//

import SwiftUI

struct ProductCard: View {
    var title: String
    var categories: [String]
    var purchasePrice: String
    var rentPrice: String
    var rentOption: String
    var description: String
    var datePosted: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title2)
            
            Text("Categories: \(categories)")
                .font(.callout)
                .foregroundStyle(.gray)
            
            Text("Price: $\(purchasePrice) | Rent: $\(rentPrice) \(rentOption)")
                .font(.callout)
                .foregroundStyle(.gray)
            
            Text(description)
                .font(.callout)
            
            HStack {
                Text("Date posted: \(datePosted)")
                
                Spacer()
                
                Text("156 views")
            }
            .font(.footnote)
            .foregroundStyle(.gray)
        }
        .padding()
        .border(.gray.opacity(0.7), width: 2)
        .padding()
    }
}

#Preview {
    ProductCard(
        title: "",
        categories: [],
        purchasePrice: "",
        rentPrice: "",
        rentOption: "",
        description: "",
        datePosted: ""
    )
}
