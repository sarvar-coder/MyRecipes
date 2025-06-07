//
//  FavouriteRecipe+CoreDataProperties.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 06/06/25.
//
//

import Foundation
import CoreData


extension FavouriteRecipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavouriteRecipe> {
        return NSFetchRequest<FavouriteRecipe>(entityName: "FavouriteRecipe")
    }

    @NSManaged public var id: String
    @NSManaged public var name: String
    @NSManaged public var video: String
    @NSManaged public var image: String
    @NSManaged public var country: String
    @NSManaged public var category: String
    @NSManaged public var tag: String
    @NSManaged public var instruction: String
    

}

extension FavouriteRecipe : Identifiable {

}
