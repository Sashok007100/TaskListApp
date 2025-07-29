//
//  StorageManager.swift
//  TaskListApp
//
//  Created by Alexandr Artemov (Mac Mini) on 29.07.2025.
//

import Foundation
import CoreData

final class StorageManager {
    static let shared = StorageManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TaskListApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private init() {}
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchTask() -> [ToDoTask] {
        let fetchRequest = ToDoTask.fetchRequest()
  
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print(error)
            return []
        }
    }
    
    func createTask(_ taskName: String) {
        let context = persistentContainer.viewContext
        
        let newTask = ToDoTask(context: context)
        newTask.title = taskName
        
        context.insert(newTask)
        saveContext()
    }
    
}
