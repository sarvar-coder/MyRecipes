//
//  RecipeDetailView.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 30/05/25.
//

import Foundation
import SwiftUI
import WebKit

struct RecipeDetailView: View {
    let recipe: Recipe
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            
            YoutubeVidoeView()
            ScrollView {
                CategoryAndCountryView()
                InstructionView()
                IngreDinetsView()
            }
        }
        .navigationTitle(recipe.name)
        .toolbarTitleDisplayMode(.inline)
    }
    
    func HeaderView() -> some View {
        Text(recipe.name)
            .font(.custom(.roboto(.medium), size: 30))
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    func YoutubeVidoeView() -> some View {
        Video(videoID: recipe.extractID())
            .frame(maxWidth: .infinity)
            .frame(height: 250)
            .clipShape(.rect(cornerRadius: 15))
            .padding(.horizontal)
    }
    
    func CategoryAndCountryView() -> some View {
        VStack(alignment: .center, spacing: 16) {
            HStack {
                Text("Category:")
                Spacer()
                Text(recipe.category)
            }
                Rectangle()
                    .frame(height: 2)
            HStack {
                Text("Country:")
                Spacer()
                Text(recipe.country)
            }
        }
        .font(.custom(.roboto(.mediumItalic), size: 20))
        .padding(15)
        .background(.red.gradient)
        .clipShape(.rect(cornerRadius: 15))
        .padding(.horizontal, 15)
    }
    
    func InstructionView() -> some View {
        Text(recipe.instructions)
            .font(.custom(.roboto(.light), size: 18))
            .frame(maxWidth: .infinity)
            .padding(15)
            .background(.yellow.gradient)
            .clipShape(.rect(cornerRadius: 15))
            .padding(.horizontal, 15)
    }
    
    func IngreDinetsView() -> some View {
        VStack(alignment: .leading) {
            ForEach(recipe.ingredMeasure()) { item in
                HStack(alignment: .center) {
                    Text(item.ingredient)
                    Spacer()
                    
                    Rectangle().frame(height: 1)
                    
                    Spacer()
                    Text(item.measure)
                }
                .font(.custom(.roboto(.semiBold), size: 20))
            }
        }
        .frame(maxWidth: .infinity)
        .padding(15)
        .background(.green.gradient)
        .clipShape(.rect(cornerRadius: 15))
        .padding(.horizontal, 15)
    }
}


#Preview {
    RecipeDetailView(recipe:
                        Recipe(id: "1",
                               name: "Paxlava",
                               category: "Dessert",
                               country: "Turkish",
                               instructions: "Do it yoursef",
                               image: "Image",
                               tag: "sweet",
                               video: "",
                               ingredients: ["kishmish", "g'o'z", "xamir"],
                               measurements: ["1 kil0", "1 qashiq", "1 lopkosa"],
                               source: "D"))
}


