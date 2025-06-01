//
//  ServiceType.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 26/05/25.
//

import Foundation

enum ServiceType: Int {
    case meal
    case drink
    
    var imageName: String {
        switch self {
        case .meal:
            return "fork.knife.circle"
        case .drink:
            return  "wineglass"
        }
    }
    
    var title: String {
        switch self {
        case .meal:
            return "Meal"
        case .drink:
            return "Drink"
        }
    }
}
