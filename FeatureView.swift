//
//  FeatureView.swift
//  HAHApro
//
//  Created by Phương An on 28/09/2024.
//

import SwiftUI

struct FeatureView: View {
    var feature: Features
    var isCompact: Bool = false // Add a flag for compact mode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
                   if isCompact {
                       // Compact version (for list)
                    VStack {
                               feature.image
                                   .resizable()
                                   .aspectRatio(contentMode: .fit)
                                   .frame(width: 100, height: 100)
                                   .padding(.top, 6)
                               
                               Text(feature.drinkName)
                                   .font(.caption)
                                   .fontWeight(.bold)
                                   .foregroundColor(.black)
                               
                               Text(feature.price)
                                   .font(.subheadline)
                                   .foregroundColor(.black)
                           }
                        
                   }
            else {
                // Full detailed version
                feature.image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.leading,55)
                Text(feature.drinkName)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.color2)
                
                HStack {
                    Text("VND:")
                        .font(.footnote)
                        .foregroundColor(.pink)
                    
                    Text(feature.price)
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                
                Text(feature.description)
                    .font(.footnote)
                    .fontWeight(.regular)
                (
                Text("Ingredients:")
                    .font(.footnote)
                    .foregroundColor(.pink)
                +
                Text(" \(feature.ingredients)")
                    .font(.footnote)
                )
            }
        }
        .padding()
    }
}
