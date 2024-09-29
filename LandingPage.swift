//
//  LandingPage.swift
//  HAHApro
//
//  Created by Phương An on 24/09/2024.
//

import SwiftUI

struct LandingPage: View {
    @EnvironmentObject var modelData: ModelData  // Updated to use `@EnvironmentObject`

    var drinks: [Features] = load("Drinks.json")
    
    var body: some View {
        NavigationView {
            VStack {
                topBar
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 15) {
                        topSection
                        buttonSection
                        drinkSection
                    }
                    .padding(.vertical)
                }
            }
            .background(Color.white.ignoresSafeArea())
        }
    }

    // Extracting the top bar into a computed property
    var topBar: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "circle.grid.2x2")
                    .font(.title2)
                    .padding(10)
                    .background(Color.pink.opacity(0.1))
                    .foregroundColor(.pink)
                    .cornerRadius(8.0)
            })
            Spacer()
            Button(action: {}, label: {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .padding(10)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(8.0)
            })
        }
        .overlay(
            HStack(spacing: 4) {
                Image("mapmarker")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 18, height: 18)
                    .foregroundColor(.red)
                Text("Thành phố Thủ Đức")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
        )
        .padding()
    }
    
    // Extracting the top section into a separate view
    var topSection: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Bạn uống gì?")
                    .font(.title)
                    .fontWeight(.bold)
                Text("HAHA khao!")
                    .font(.title)
                    .foregroundColor(.red)
                    .fontWeight(.bold)
                Button(action: {}, label: {
                    Text("Order ngay")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color.pink)
                        .clipShape(Capsule())
                })
            }
            .padding(.leading)
            Spacer(minLength: 0)
            Image("coffee")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width / 3)
        }
        .padding()
        .background(.color1)
        .cornerRadius(15)
        .padding(.horizontal)
    }
    
    // Extracting the button section into a separate view
    var buttonSection: some View {
        HStack(spacing: 10) {
            Button(action: {}, label: {
                Image("coffeeshop")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .cornerRadius(10)
                    .padding(.leading,30)
            })
            Spacer()
            Button(action: {}, label: {
                Image("Shipper")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .padding(.trailing, 0)
                    .padding(.bottom, 5)
                    .cornerRadius(15)
                    .padding(.trailing,30)
            })
        }
        .padding(.horizontal)
    }
    // Updated drinkSection to integrate CategoryRow for displaying categories
        var drinkSection: some View {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
            }
            .padding(.horizontal)
        }

}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
            .environmentObject(ModelData()) // Provide an environment object for preview
    }
}
