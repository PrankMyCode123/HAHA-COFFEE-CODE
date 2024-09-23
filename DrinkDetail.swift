//
//  DrinkDetail.swift
//  HAHA
//
//  Created by Nguyễn Lý Anh Huy on 23/09/2024.
//

import SwiftUI

struct DrinkDetail: View {
    var drink: Features
    // State variable to hold the confirmed ice level
    @State private var confirmedIceLevel: Int? = nil
    
    var body: some View {
        ScrollView{
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
                
                // Embed IceSelectionView and pass the binding for confirmedIceLevel
                SelectionView()
            }
        }
    }
}

#Preview {
    DrinkDetail(drink: ModelData().drinks[0])
}
