//
//  FavouriteView.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/05/25.
//

import SwiftUI

struct FavouriteView: View {
    
    @FetchRequest(sortDescriptors: []) var recipes: FetchedResults<FavouriteRecipe>
    @Environment(\.managedObjectContext) var viewContext
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(recipes) { recipe in
                        NavigationLink {
                            RecipeDetailView(recipe: Recipe(favouriteRecipe: recipe))
                        } label: {
                            FavouriteCellView(recipe: recipe)
                                
                        }
                        .foregroundStyle(.black)
                    }
                    .onDelete(perform: delete)
                }
                .contentMargins(20, for: .scrollContent)
                .defaultScrollAnchor(.leading)
            }
            .navigationTitle("FavouriteView")
        }
    }
    
    private func delete(_ indexset: IndexSet) {
        indexset.forEach { index in
            let recipe = recipes[index]
            viewContext.delete(recipe)
            do {
                try viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
        
}

#Preview {
    NavigationStack {
        FavouriteView()
            .environment(\.managedObjectContext, CoreDataManager.preview.viewcontext)
    }
}

struct FavouriteCellView: View {
    let recipe: FavouriteRecipe
    var body: some View {
        HStack(spacing: 20) {
            ImageView()
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(recipe.category)
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Image(systemName: "chevron.right")
        }
    }
    
    
    @ViewBuilder
    func ImageView() -> some View {
        AsyncImage(url: URL(string: recipe.image)) { image in
            image
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(.circle)
        } placeholder: {
            Circle()
                .fill(.clear)
                .frame(width: 80, height: 80)
                .clipShape(.circle)
        }

    }
}
