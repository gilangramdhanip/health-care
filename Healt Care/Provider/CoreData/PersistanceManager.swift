//
//  PersistanceManager.swift
//  Healt Care
//
//  Created by Gilang Ramdhani Putra on 25/09/23.
//

import CoreData

class PersistanceManager {
    
    static let shared = PersistanceManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Credentials")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveUserToken(token: String) {
        do {
            let credentials = Credentials(context: persistentContainer.viewContext)
            credentials.token = token
            
            saveContext()
        }
        
    }
    
    func getToken() -> [Credentials] {
        let  request : NSFetchRequest<Credentials> = Credentials.fetchRequest()
        
        var credentials : [Credentials] = []
        
        do {
            credentials = try persistentContainer.viewContext.fetch(request)
        } catch {
            print("Error fetching data")
        }
        
        return credentials
    }
    
    func removeToken() {
        let request: NSFetchRequest<Credentials> = Credentials.fetchRequest()
        let credentials = try? persistentContainer.viewContext.fetch(request)
        for credential in credentials ?? [] {
            persistentContainer.viewContext.delete(credential)
        }
        
        saveContext()
    }
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
