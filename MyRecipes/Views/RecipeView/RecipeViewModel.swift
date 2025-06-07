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
            refresh()
        }
    }
    @Published var recipes = [Recipe]()
    @Published var serviceImage: ServiceType = .meal
    
    init() {
        service = MealService()
        fetchInLoop()
    }
    
    deinit {
        removeAllRecipe()
    }
    
    func refresh() {
        removeAllRecipe()
        fetchInLoop()
    }
    
    func fetchInLoop() {
        for _ in 1...10 {
            fetch()
        }
    }
    
    func fetch() {
        service.fetch { result in
            switch result {
            case .success(let success):
//                print(success[0].video)
                self.recipes.append(success[0])
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func removeAllRecipe() {
        recipes.removeAll()
    }

}


