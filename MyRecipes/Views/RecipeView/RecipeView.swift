//
//  RecipeView.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/05/25.
//

import SwiftUI
//https://www.thecocktaildb.com/images/media/drink/of1rj41504348346.jpg
struct RecipeView: View {
    
    @StateObject private var vm = RecipeViewModel(service: MealService())
    var body: some View {
        NavigationStack {
            
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack() {
                        ForEach(vm.recipes) { recipe in
                                CardView(recipe)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollClipDisabled()
                .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                .contentMargins(16, for: .scrollContent)
                .frame(height: 500)
                
                Button {
                    vm.refresh()
                } label: {
                    Text("Refresh")
                        .font(.title)
                        .fontWeight(.bold)
                        .fontDesign(.serif)
                        .fontWidth(.condensed)
                        .foregroundStyle(.white)
                        .frame(width: 300, height: 40)
                }
                .padding(9)
                .buttonStyle(.borderedProminent)
                .tint(.cyan)
            }
            .navigationTitle("Meal Recipe")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                   
                    
                }
            }
            .background {
                Image("backGround").resizable()
                    .frame(width: 400, height: 1000)
            }
        }
    }
    
    @ViewBuilder
    private func CardView(_ recipe: Recipe) -> some View {
        
        VStack(alignment: .center, spacing: 8) {
            NavigationLink {
               RecipeDetailView(recipe: recipe)
            } label: {
                HStack {
                    TapImageView()
                    Spacer()
                    Text(recipe.name)
                        .font(.custom(.roboto(.mediumItalic), size: 23, relativeTo: .largeTitle))
                        .foregroundStyle(.white)
                        .frame(width: 200, height: 30)
                    Spacer()
                    TapImageView()
                } 
                .padding(5)
                .border(.white, width: 1)
            }
          Rectangle()
                .fill(.white)
                .frame(height: 4)
            AsyncImage(url: URL(string: recipe.image)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(.rect(cornerRadius: 10))
                } else if phase.image == nil {
                    
                } else {
                    
                }
            }
            HStack() {
                Text("Category:")
                Spacer()
                Text(recipe.category)
            }
            .font(.custom(.roboto(.mediumItalic), size: 23))
            .foregroundStyle(.white)
        }
        .padding(15)
        .background(.cyan.gradient)
        .clipShape(.rect(cornerRadius: 20))
        .containerRelativeFrame(.horizontal, count: 1, spacing: 0.0)
        .scrollTransition { content, phase in
            content
                .scaleEffect(x: phase.isIdentity ? 1 : 0.9,
                             y: phase.isIdentity ? 1 : 0.3,
                             anchor: .center)
        }
    }
    
    func TapImageView() -> some View {
        Image(systemName: "hand.tap.fill")
            .resizable()
            .frame(width: 32, height: 32)
            .tint(.white)
    }
}

#Preview {
    NavigationStack {
        RecipeView()
    }
}


//.scrollTransition(.interactive) { content, phase in
//    content
//        .blur(radius: phase == .identity ? 0 : 2, opaque: false)
//        .scaleEffect(phase == .identity ? 1 : 0.9, anchor: .bottom)
//        .offset(y: phase == .identity ? 0 : -10)
//        .rotationEffect(.init(degrees: phase == .identity ? 0 : phase.value * 5), anchor: .bottomTrailing)
//        .offset(x: minX < 0 ? minX / 2 : -minX)
//}


