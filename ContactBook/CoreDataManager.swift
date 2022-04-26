//
//  CoreDataManager.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import CoreData
import UIKit

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
    
    func saveContext(_ context: NSManagedObjectContext = CoreDataManager.sharedInstance.context) {
        guard context.hasChanges else { return }
        
        do {
            try context.save()
        } catch let error {
            print("Error:", error)
        }
    }
}
