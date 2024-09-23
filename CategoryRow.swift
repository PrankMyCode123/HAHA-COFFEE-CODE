//
//  CategoryRow.swift
//  HAHACOFFEE
//
//  Created by Đinh Trung Quốc Anh on 21/9/24.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Features]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 10)
                .foregroundColor(.color2)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) {drink in
                        NavigationLink {
                            DrinkDetail(drink: drink)
                        } label: {
                            CategoryItem(drink: drink)
                                .foregroundColor(.color2)
                        }
                    }
                }
            }
            .frame(height: 200)
        }
        .padding(.bottom, 10)
        .background(.white)
    }
}

#Preview {
    let drinks = ModelData().drinks
    return CategoryRow(
        categoryName: drinks[0].category.rawValue,
        items: Array(drinks.prefix(4))
    )
}
