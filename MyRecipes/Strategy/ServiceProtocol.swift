//
//  ServiceProtocol.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 11/05/25.
//

import Foundation

protocol ServiceProtocol {
    func fetch() async throws -> [Recipe]
}

