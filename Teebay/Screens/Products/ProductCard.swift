//
//  ProductCard.swift
//  Teebay
//
//  Created by Maraz Hossain on 6/17/25.
//

import SwiftUI

struct ProductCard: View {    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Title")
                .font(.title2)
            
            Text("Categories: Lorem, Ipsum")
                .font(.callout)
                .foregroundStyle(.gray)
            
            Text("Price: $500 | Rent: $100 daily")
                .font(.callout)
                .foregroundStyle(.gray)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam pretium arcu ipsum, ac aliquam dui sagittis eu. Curabitur suscipit enim.")
                .font(.callout)
            
            HStack {
                Text("Date posted: 21st August 2020")
                
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
    ProductCard()
}
