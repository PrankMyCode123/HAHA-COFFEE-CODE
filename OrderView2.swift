//
//  OrderView2.swift
//  HAHACOFFEE
//
//  Created by SEIU iMac 4 on 22/10/2024.
//

import SwiftUI

struct CoffeeOrderView2: View {
    @State private var selectedSize: String = "L"
    @State private var selectedIce: String = "Normal"
    @State private var selectedSugar: String = "Normal"
    @State private var quantity: Int = 1
    
    var drink:Features
   
    var body: some View {
        ScrollView {
            VStack {
                // Coffee Image
                drink.image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .padding(.top)
                
                // Coffee Name and Description
                VStack(alignment: .leading) {
                    Text(drink.drinkName)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(drink.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.vertical, 8)
                    Text(drink.ingredients)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.vertical, 8)
                }
                .padding(.horizontal)
                
                // Size Selection
                VStack(alignment: .leading) {
                    
                        Text("Size")
                            .font(.headline)
                    
                    HStack {
                        Button(action: {
                            selectedSize = "L"
                        }) {
                            HStack {
                                Image(systemName: selectedSize == "L" ? "checkmark.circle.fill" : "circle")
                                Text("L")
                            }
                            .padding()
                            .foregroundColor(.color2)
                        }
                        Button(action: {
                            selectedSize = "S"
                        }) {
                            HStack {
                                Image(systemName: selectedSize == "S" ? "checkmark.circle.fill" : "circle")
                                Text("S")
                            }
                            .padding()
                            .foregroundColor(.color2)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
                
                // Ice Level Selection
                VStack(alignment: .leading) {
                    Text("Chọn mức đá")
                        .font(.headline)
                    HStack {
                        Button(action: {
                            selectedIce = "Normal"
                        }) {
                            HStack {
                                Image(systemName: selectedIce == "Normal" ? "checkmark.circle.fill" : "circle")
                                Text("Đá bình thường")
                            }
                            .padding()
                            .foregroundColor(.color2)
                        }
                        Button(action: {
                            selectedIce = "Less Ice"
                        }) {
                            HStack {
                                Image(systemName: selectedIce == "Less Ice" ? "checkmark.circle.fill" : "circle")
                                Text("Ít đá")
                            }
                            .padding()
                            .foregroundColor(.color2)
                        }
                        Button(action: {
                            selectedIce = "No Ice"
                        }) {
                            HStack {
                                Image(systemName: selectedIce == "No Ice" ? "checkmark.circle.fill" : "circle")
                                Text("Không đá")
                            }
                            .padding()
                            .foregroundColor(.color2)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
                
                // Sugar Level Selection
                VStack(alignment: .leading) {
                    Text("Chọn mức đường")
                        .font(.headline)
                    HStack {
                        Button(action: {
                            selectedSugar = "Normal"
                        }) {
                            HStack {
                                Image(systemName: selectedSugar == "Normal" ? "checkmark.circle.fill" : "circle")
                                Text("Ngọt bình thường")
                            }
                            .padding()
                            .foregroundColor(.color2)
                        }
                        Button(action: {
                            selectedSugar = "Less Sugar"
                        }) {
                            HStack {
                                Image(systemName: selectedSugar == "Less Sugar" ? "checkmark.circle.fill" : "circle")
                                Text("Ít ngọt")
                            }
                            .padding()
                            .foregroundColor(.color2)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)

                // Quantity Selector
                HStack {
                    Stepper("Quantity: \(quantity)", value: $quantity, in: 1...10)
                }
                .padding()
                
                // Price & Add to Cart
                VStack {
                    HStack {
                        Text("1 Sản phẩm")
                        Spacer()
                        Text("\(drink.price)")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal)
                    
                    Button(action: {
                        // Add to cart action
                    }) {
                        Text("Thêm vào giỏ hàng")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.color2)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
        }
        .navigationBarTitle(Text(drink.drinkName), displayMode: .inline)
    }
   
        
}

#Preview {
    CoffeeOrderView2(drink: ModelData().drinks[0])
}

