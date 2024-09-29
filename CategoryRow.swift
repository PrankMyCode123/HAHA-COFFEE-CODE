//
//  CategoryRow.swift
//  HAHACOFFEE
//
//  Created by Đinh Trung Quốc Anh on 21/9/24.
// Trần Nguyễn Phương An - syncer on 29/09/2024

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Features]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(categoryName)
                    .font(.headline)
                    .padding(.leading, 10)
                    .foregroundColor(.black)
                Spacer()
                Button(action: {}) {
                    HStack(spacing: 4) {
                        Text("Xem thêm")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.pink)
                        
                        Image(systemName: "chevron.right")
                            .font(.footnote)
                            .foregroundColor(.white)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 6)
                            .background(Color.pink)
                            .cornerRadius(5)
                    }
                }
                .padding(.trailing, 10)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 10) {
                    ForEach(items) { drink in
                        NavigationLink(destination: FeatureView(feature: drink)) {
                            FeatureView(feature: drink, isCompact: true)
                                .frame(width: 150)
                                .background(.color1) // Updated to a working color.
                                .cornerRadius(20)
                                .padding(.horizontal, 5)
                        }
                    }
                }
            }
            .frame(height: 150)
        }
        .padding(.bottom, 10)
        .background(.white)
    }
}

#Preview {
    NavigationView {
        let drinks = ModelData().drinks
        CategoryRow(
            categoryName: drinks[0].category.rawValue,
            items: Array(drinks.prefix(4))
        )
    }
}
