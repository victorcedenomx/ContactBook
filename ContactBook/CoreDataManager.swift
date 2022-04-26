//
//  CoreDataManager.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import CoreData

open class CoreDataManager {
    
    static let sharedInstance = CoreDataManager()
    
    public init() {}
    
    var context: NSManagedObjectContext {
        let context = persistentContainer.viewContext
        context.automaticallyMergesChangesFromParent = true
        return context
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ContactBook")
        
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    func saveContext(_ context: NSManagedObjectContext = CoreDataManager.sharedInstance.context) -> Bool {
        guard context.hasChanges else { return true }
        
        do {
            try context.save()
            return true
        } catch let error {
            print("Error:", error)
            return false
        }
    }
}
