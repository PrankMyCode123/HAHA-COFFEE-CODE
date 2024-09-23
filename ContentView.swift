//
//  ContentView.swift
//  HAHACOFFEE
//
//  Created by Đinh Trung Quốc Anh on 20/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Image("LOGO")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300, alignment: .center)
                    
                    Text("Choose your language")
                        .font(Font.system(size: 15))
                        .foregroundStyle(.color2)
                        .bold()
                        .padding(.top)
                    
                    VStack {
                        NavigationLink(destination: EnglishView(), label: {
                            Text("English 🇬🇧")
                                .font(Font.system(size: 15))
                                .padding(5)
                        })
                        
                        NavigationLink(destination: MainView_Viet(), label: {
                            Text("Tiếng Việt 🇻🇳")
                                .font(Font.system(size: 15))
                            
                        })
                    }
                }
                Text("Copyright © HAHA Coffee All Rights Reserved.")
                    .foregroundStyle(.color2)
                    .frame(maxHeight: .infinity, alignment: .bottom )
                    .font(Font.system(size: 13))
            }
        }
    }
}

struct EnglishView: View {
    var body: some View {
        Text("Sorry! We are updating English view.")
            .foregroundStyle(.color2)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environment(ModelData())
    }
}
