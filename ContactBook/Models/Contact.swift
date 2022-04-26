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
    static func createContact(_ contact: Contact, context: NSManagedObjectContext = CoreDataManager.sharedInstance.context) {
        CoreDataManager.sharedInstance.saveContext(context)
    }
    
    static func getAllContacts(context: NSManagedObjectContext = CoreDataManager.sharedInstance.context) -> [Contact] {
        let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
        
        do {
            let contacts = try context.fetch(fetchRequest)
            return contacts
        } catch let error {
            print("Error:", error)
        }
        
        return []
    }
    
    static func deleteContact(_ contact: Contact, context: NSManagedObjectContext = CoreDataManager.sharedInstance.context) {
        context.delete(contact)
        
        CoreDataManager.sharedInstance.saveContext(context)
    }
    
    static func getContact(withId id: Int64) -> Contact? {
        let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
        let idPredicate = NSPredicate(format: "id == %ld", id)
        let predicates: [NSPredicate] = [idPredicate]
        
        fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
        
        do {
            let contacts = try CoreDataManager.sharedInstance.context.fetch(fetchRequest)
            
            if contacts.count == 1 {
                return contacts.first
            }
        } catch let error {
            print("Error:", error)
        }
        
        return nil
    }
}
