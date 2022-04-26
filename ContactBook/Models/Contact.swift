//
//  Contact.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import CoreData

class Contact: NSManagedObject {

}

extension Contact {
    static func createContact(_ contact: Contact, context: NSManagedObjectContext = CoreDataManager.sharedInstance.context) -> Bool {
        guard !someEntityExists(contact: contact) else { return false }
        
        // Save the event on disk
        
        return CoreDataManager.sharedInstance.saveContext(context)
    }
    
    static func getAllContacts(context: NSManagedObjectContext = CoreDataManager.sharedInstance.context) -> [Contact] {
        let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
        
        do {
            return try context.fetch(fetchRequest)
        } catch let error {
            print("Error:", error)
        }
        
        return []
    }
    
    static private func someEntityExists(contact: Contact, context: NSManagedObjectContext = CoreDataManager.sharedInstance.context) -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Contact")
        fetchRequest.predicate = NSPredicate(format: "id == %d", contact.id)
        fetchRequest.includesSubentities = false
        
        var entitiesCount = 0

        do {
            entitiesCount = try context.count(for: fetchRequest)
        } catch {
            print("Error:", error)
        }

        return entitiesCount > 0
    }
}
