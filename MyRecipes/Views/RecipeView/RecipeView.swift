//
//  RecipeView.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/05/25.
//

import SwiftUI

struct RecipeView: View {
    
    @StateObject private var vm = RecipeViewModel()
    
    @State private var showServiceChangeView = false
    
    var body: some View {
        NavigationStack {
           
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(vm.recipes) { recipe in
                        CardView(recipe)
                            .task {
                               await vm.loadMoreRecipes(recipeID: recipe.id)
                            }
                    }
                }
                .task {
                    await vm.fetchInLoop()
                }
                .scrollTargetLayout()
            }
            .scrollClipDisabled()
            .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
            .contentMargins(16, for: .scrollContent)
            
            Button {
                Task {
                   await vm.refresh()
                }
            } label: {
                Text("Refresh")
                    .font(.title)
                    .fontWeight(.bold)
                    .fontDesign(.serif)
                    .fontWidth(.condensed)
                    .foregroundStyle(.white)
                    .frame(width: 300, height: 40)
            }
            .offset(y: -10)
            .padding(9)
            .buttonStyle(.borderedProminent)
            .tint(.cyan)
            .navigationTitle("\(vm.serviceImage.title) Recipe")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showServiceChangeView.toggle()
                    } label: {
                        Image(systemName: vm.serviceImage.imageName)
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    
                }
            }
            
            .sheet(isPresented: $showServiceChangeView) {
                ServiceChangeView(service: $vm.service, serviceType: $vm.serviceImage)
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
                    
                    Text(recipe.name)
                        .font(.custom(.roboto(.mediumItalic), size: 23, relativeTo: .largeTitle))
                        .foregroundStyle(.white)
                        .frame(width: 200, height: 30)
                    Image(systemName:"arrow.up.forward")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.white)
                    
                }
                .padding(5)
                .border(.white, width: 1)
            }
            Rectangle()
                .fill(.white)
                .frame(height: 4)
            AsyncImage(url: recipe.imageURL) { image in
                image
                    .resizable()
                    .frame(width: screenWidth - 60, height: 300)
                    .clipShape(.rect(cornerRadius: 10))
            } placeholder: {
                ProgressView()
                    .frame(width: screenWidth - 60, height: 300)
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
                .blur(radius: phase == .identity ? 0 : 2)
                .scaleEffect(y: phase.isIdentity ? 1 : 0.2,
                             anchor: .center)
//                .rotationEffect(.init(degrees: phase == .identity ? 0 : phase.value * 5), anchor: .bottomTrailing)
        }
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


