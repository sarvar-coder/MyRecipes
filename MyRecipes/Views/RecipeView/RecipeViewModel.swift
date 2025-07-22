//
//  RecipeViewModel.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 26/05/25.
//

import Foundation


class RecipeViewModel: ObservableObject {
        
    @Published var service: ServiceProtocol = MealService() {
        didSet {
            Task {
              await refresh()
            }
        }
    }
    @Published var recipes = [Recipe]()
    @Published var serviceImage: ServiceType = .meal
    
    init() {
        service = MealService()
    }
    
    deinit {
        removeAllRecipe()
    }
    
    func refresh() async {
        removeAllRecipe()
        await fetchInLoop()
    }
    
    func fetchInLoop() async {
        for _ in 1...10 {
            await fetch()
        }
    }
    @MainActor
    func fetch() async {
        do {
            
            recipes.append(contentsOf: try await service.fetch())
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func removeAllRecipe() {
        recipes.removeAll()
    }

}


