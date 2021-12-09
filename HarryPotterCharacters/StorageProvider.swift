//
//  StorageProvider.swift
//  HarryPotterCharacters
//
//  Created by Matthew Hollyhead on 09/12/2021.
//

import Foundation
import UIKit
import CoreData

class PersistentContainer: NSPersistentContainer {}

class StorageProvider {
    
    static var shared = StorageProvider()
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "HarryPotterCharacters")
        
        persistentContainer.loadPersistentStores(completionHandler: { description, error in
            if let error = error {
                fatalError("Core Data Store failed to load with error: \(error)")
            }
        })
    }
}

extension StorageProvider {
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("Context saved")
            } catch {
                let nerror = error as NSError
                fatalError("unresolved error \(nerror), \(nerror.userInfo)")
            }
        }
    }
    
    func getAllFavorites() -> [FavoriteCharacter] {
        let fetchRequest: NSFetchRequest<FavoriteCharacter> = FavoriteCharacter.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print("Failed to fetch Characters \(error)")
            return []
        }
    }
    
    func deleteFavoriteCharacter(_ character: FavoriteCharacter) {
        persistentContainer.viewContext.delete(character)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("failed to delete favorite character: \(error)")
        }
    }
}
