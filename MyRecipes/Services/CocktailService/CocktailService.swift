//
//  CocktailService.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 11/05/25.
//

import Foundation

class CocktailService: ServiceProtocol {
    
    private let manager: RequestManagerProtocol
    
    init(manager: RequestManagerProtocol = RequestManager()) {
        self.manager = manager
    }
    
    func fetch() async throws -> [Recipe] {
        let data: Cocktail = try await manager.perform(DrinkRequest.random, host: .drinkHost)
        
        let result = map(data.drinks)
        
        return result
    }
    
    func map(_ array: [CocktailRecipe]) -> [Recipe] {
        array.map { drink in
            Recipe(id: drink.idDrink,
                   name: drink.strDrink,
                   category: drink.strCategory,
                   country: "",
                   instructions: drink.strInstructions,
                   image: drink.strDrinkThumb,
                   tag: drink.strTags ?? "",
                   video: drink.strVideo ?? "",
                   ingredients: drink.ingredients(),
                   measurements: drink.measurments(),
                   source: "")
        }
    }
//    func fetch(handler: @escaping (Result<[Recipe], Error>) -> Void) {
//        let url = URL(string: CocktailURL.randomEndpoint)!
//
//        let urlRequest = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//            DispatchQueue.main.async {
//                if let error {
//                    handler(.failure(error))
//                }
//
//
//                guard let httpResponse = response as? HTTPURLResponse,
//                      (200...299).contains(httpResponse.statusCode) else { return }
//
//                guard let data = data else { return }
//
//                do {
//                    let result = try JSONDecoder().decode(Cocktail.self, from: data)
//                    let recipe = self.map(result.drinks)
//                    handler(.success(recipe))
//                } catch {
//                    handler(.failure(error))
//                }
//            }
//
//        }.resume()
//    }
}
