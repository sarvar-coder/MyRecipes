//
//  CoreDataManager.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 05/06/25.
//

import Foundation
import CoreData

class CoreDataManager {
        
    let persistenContainer: NSPersistentContainer
    
    var viewcontext: NSManagedObjectContext {
        persistenContainer.viewContext
    }
    
    static var preview: CoreDataManager {
        let manager = CoreDataManager(inMemory: true)
        
        let viewcontext = manager.viewcontext
        
        for i in 1...10 {
            let recipe = FavouriteRecipe(context: viewcontext)
            
            recipe.id = "\(i)"
            recipe.name = "Paxlava"
            recipe.image = "https://www.thecocktaildb.com/images/media/drink/j6q35t1504889399.jpg"
            recipe.video = "https://www.youtube.com/watch?v=TmeUJ2g3ogM"
            recipe.category = "Drinks"
            recipe.country = "Uzb"
            recipe.tag = "no"
        }
        
        do {
            try viewcontext.save()
        } catch {
            print(error.localizedDescription)
        }
        
        return manager
    }
    
    init(inMemory: Bool = false) {
        self.persistenContainer = NSPersistentContainer(name: "Favourites")
        
        if inMemory {
            setupDevNullDataURL()
        }
        
        loadPersistentContainer()
    }
    

    
    private func deleteOldStore() {
        if let storeURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("FavouriteRecipe.sqlite") {
            do {
                try FileManager.default.removeItem(at: storeURL)
                print("deleted old store")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func loadPersistentContainer() {
        persistenContainer.loadPersistentStores { _, error in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        persistenContainer.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    private func setupDevNullDataURL() {
        persistenContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    }
}
