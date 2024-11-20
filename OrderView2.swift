import SwiftUI

struct CoffeeOrderView2: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var selectedSize: String = "L"
    @State private var selectedIce: String = "Normal"
    @State private var selectedSugar: String = "Normal"
    @State private var quantity: Int = 1
    @State private var navigateToCart: Bool = false // State to control navigation
    
    var drink: Features
    
    var body: some View {
        NavigationStack { // Use NavigationStack for the new API
            ScrollView {
                drink.image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .padding(.top)
                VStack(alignment: .leading, spacing: 20) {
                    // Coffee Image
                    
                    
                    // Coffee Name and Description
                    VStack(alignment: .leading, spacing: 8) {
                        Text(drink.drinkName)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(drink.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text(drink.ingredients)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    // Size Selection
                    VStack(alignment: .leading, spacing: 10) {
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
                    }
                    
                    // Ice Level Selection
                    VStack(alignment: .leading, spacing: 10) {
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
                    }
                    
                    // Sugar Level Selection
                    VStack(alignment: .leading, spacing: 10) {
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
                    }
                    
                    // Quantity Selector
                    HStack {
                        Stepper("Số lượng: \(quantity)", value: $quantity, in: 1...10)
                    }
                    
                    // Price & Add to Cart
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("\(quantity) Sản phẩm")
                            Spacer()
                            Text("\(Int(drink.price.components(separatedBy: ".").joined())! * quantity)")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        
                        /*Button(action: {
                            cartManager.addToCart(drink: drink)
                            navigateToCart = true // Set navigation state to true
                        }) {
                            Text("Thêm vào giỏ hàng")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.color2)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 20)*/
                    }
                }
                .padding(.horizontal)
                //.navigationDestination(isPresented: $navigateToCart) {
                //  CartView().environmentObject(cartManager) // Navigate to CartView
                
            }
            .navigationBarTitle(Text(drink.drinkName), displayMode: .inline)
        }
    }
}

#Preview {
    CoffeeOrderView2(drink: ModelData().drinks[0])
        //.environmentObject(CartManager()) 
}
