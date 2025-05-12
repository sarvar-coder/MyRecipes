//
//  MealService.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 11/05/25.
//

import Foundation

class MealService: ServiceProtocol {
    func fetch(handler: @escaping (Result<[Recipe], Error>) -> Void) {
        let url = URL(string: MealURL.randomEndpoint)!
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                if let error {
                    handler(.failure(error))
                }
                
                
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else { return }
                
                guard let data = data else { return }
                
                do {
                    let result = try JSONDecoder().decode(Meal.self, from: data)
                    let recipe = self.map(result.meals)
                    handler(.success(recipe))
                } catch {
                    handler(.failure(error))
                }
            }
            
        }.resume()
    }
    
    func map(_ array: [MealRecipe]) -> [Recipe] {
        array.map { meal in
            Recipe(id: meal.idMeal,
                   name: meal.strMeal,
                   category: meal.strCategory,
                   country: meal.strArea,
                   instructions: meal.strInstructions,
                   image: meal.strMealThumb,
                   tag: meal.strTags ?? "",
                   video: meal.strYoutube,
                   ingredients: meal.ingredients(),
                   measurements: meal.measurments(),
                   source: meal.strSource)
        }
    }
}
