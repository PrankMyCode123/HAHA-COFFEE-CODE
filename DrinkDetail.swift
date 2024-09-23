//
//  DrinkDetail.swift
//  HAHACOFFEE
//
//  Created by Đinh Trung Quốc Anh on 22/9/24.
//

import SwiftUI

struct DrinkDetail: View {
    var drink: Features
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(drink.drinkName)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 30))
            Text(drink.price)
                .padding(.leading, 5)
            drink.image
                .resizable()
                .frame(width: 350, height: 350, alignment: .center)
                .scaledToFill()
                .cornerRadius(10)
                .padding(.bottom, 10)
            Text(drink.description)
                .font(.system(size: 18))
                .font(.caption)
                .frame(width: 350, alignment: .leading)
                .padding(.bottom, 10)
            Text(drink.ingredients)
                .font(.system(size: 18))
                .font(.caption)
                .frame(width: 350, alignment: .leading)
        }
    }
}

#Preview {
    DrinkDetail(drink: ModelData().drinks[0])
}
