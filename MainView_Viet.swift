//
//  MainView_Viet.swift
//  HAHACOFFEE
//
//  Created by Đinh Trung Quốc Anh on 21/9/24.
// Trần Nguyễn Phương An was here on 29/09/2024

import SwiftUI

struct MainView_Viet: View {
    @State var selectedTab: String = "home"  // Removed `selectedRecom`

    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTab) {
                LandingPage()
                    .tag("home")
                Color.pink
                    .tag("cup")
                Color.yellow
                    .tag("bell")
                Color.red
                    .tag("cart")
            }
            // Custom Tab Bar
            CustomTabBar(selectedTab: $selectedTab)
        }
        .onAppear {
            // Move appearance changes to onAppear to avoid thread issues in init
            UITabBar.appearance().isHidden = true
        }
    }
}

struct MainView_Viet_Previews: PreviewProvider {
    static var previews: some View {
        MainView_Viet()
            .environmentObject(ModelData())  // Ensure the environment object is available for LandingPage
    }
}
