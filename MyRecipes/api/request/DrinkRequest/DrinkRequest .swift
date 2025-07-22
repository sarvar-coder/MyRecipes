//
//  DrinkRequest .swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 22/07/25.
//

import Foundation

enum DrinkRequest: RequestProtocol {
    case random
    
    var path: String {
        switch self {
        case .random:
            return "/api/json/v1/1/random.php"
        }
    }
    
    var requestType: RequestType {
        switch self {
        case .random:
            return .GET
        }
    }  
}
