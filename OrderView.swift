import SwiftUI

struct CoffeeOrderView: View {
    var drink: Features
    
    @State private var coffeeSize: String = "Medium"
    @State private var sugarQuantity: Int = 2
    @State private var cupCount: Int = 1
    
    let sizes = ["Small", "Medium", "Large"]
    
    var body: some View {
        ScrollView{
            VStack {
                // Coffee Image and Title
                drink.image
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding()
                  
                Text(drink.drinkName)
                    .font(.title)
                    .fontWeight(.bold)
                (
                Text(drink.description)
                    .font(.footnote)
                    .fontWeight(.regular)
                )
                 (
                    
                Text(" \(drink.ingredients)")
                        .font(.footnote)
                )
                
                Text("\(drink.price)")
                    .font(.title2)
                    .foregroundColor(.color2)
                    .padding(.bottom, 20)
                
                // Quantity Selector
                HStack {
                    Text("Số lượng")
                        .font(.title)
                        .padding()
                    Button(action: {
                        if cupCount > 1 {
                            cupCount -= 1
                        }
                    }) {
                        Image(systemName: "minus.circle")
                            .font(.system(size: 32))
                            .foregroundColor(.gray)
                    }
                    
                    Text("\(cupCount)")
                        .font(.title)
                        .frame(width: 50)
                    
                    Button(action: {
                        cupCount += 1
                    }) {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 32))
                            .foregroundColor(.color2)
                    }
                }
                .padding(.bottom, 20)
                
                // Size Selector
                Text("Size")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                HStack {
                    ForEach(sizes, id: \.self) { size in
                        Button(action: {
                            coffeeSize = size
                        }) {
                            VStack {
                                Image(systemName: size == "M" ? "circle.fill" : size == "Medium" ? "circle.fill" : "circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(coffeeSize == size ? .color2 : .color2)
                                Text(size)
                            }
                        }
                    }
                }
                .padding(.bottom, 20)
                //đá
                
                
                // Sugar Quantity Selector
                Text("Đường")
                    .font(.headline)
                    .padding(.bottom, 10)
                
                HStack {
                    ForEach(0..<5) { index in
                        Button(action: {
                            sugarQuantity = index
                        }) {
                            Image(systemName: index < sugarQuantity ? "cube.fill" : "cube")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(index < sugarQuantity ? .color2 : .gray)
                        }
                    }
                }
                
                //Ice
                Text("Đá")
                    .font(.headline)
                    .padding(.bottom, 10)
                
                HStack {
                    ForEach(0..<5) { index in
                        Button(action: {
                            sugarQuantity = index
                        }) {
                            Image(systemName: index < sugarQuantity ? "cube.fill" : "cube")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(index < sugarQuantity ? .color2 : .gray)
                        }
                    }
                }
                .padding(.bottom, 30)
                
                // Add to Cart Button
                Button(action: {
                    // Action to add coffee to cart
                }) {
                    Text("Add to cart")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.color2)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .padding()
            .navigationBarTitle("Order Coffee", displayMode: .inline)
        }
    }
}
#Preview {
    CoffeeOrderView(drink: ModelData().drinks[0])
}


