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
            RecipeView()
                .tabItem {
                    Label("Recipe", systemImage: "book")
                }.tag(0)
            
            FavouriteView()
                .tabItem {
                    Label("Favourites", systemImage: "heart")
                }
            
        }
    }
}

#Preview {
    MainTabBar()
}
