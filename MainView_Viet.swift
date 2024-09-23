//
//  MainView_Viet.swift
//  HAHACOFFEE
//
//  Created by Đinh Trung Quốc Anh on 21/9/24.
//

import SwiftUI

struct MainView_Viet: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            NavigationSplitView {
                List {
                    ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    }
                    .listRowInsets(EdgeInsets())
                }
                .navigationTitle("Chào Laughters!")
            } detail: {
                Text("Select")
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .frame(width: 430, height: 900)
        }
    }
}

#Preview {
        MainView_Viet()
        .environment(ModelData())
    }

