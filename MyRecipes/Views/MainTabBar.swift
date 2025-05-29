//
//  MainTabBar.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 11/05/25.
//

import Foundation
import SwiftUI
 
struct MainTabBar: View {
    var body: some View {
        TabView {
            Text("Main View")
                .tabItem {
                    Label("Recipe", systemImage: "book")
                }.tag(0)
            
            Text("Favourite View")
                .tabItem {
                    Label("Favourites", systemImage: "heart")
                }
            
        }
    }
}

#Preview {
    MainTabBar()
}
