//
//  CategoryItem.swift
//  HAHACOFFEE
//
//  Created by Đinh Trung Quốc Anh on 21/9/24.
//

import SwiftUI

struct CategoryItem: View {
    var drink: Features
    
    var body: some View {
        VStack(alignment: .leading) {
            drink.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .scaledToFill()
                .cornerRadius(5)
            Text(drink.drinkName)
                .font(.caption)
                .foregroundStyle(.primary)
                .frame(width: 155, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(drink.price)
                .font(.caption)
                .frame(width: 155, alignment: .center)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    CategoryItem(drink: ModelData().drinks[0])
}
