//
//  CoreDataManager.swift
//  MVVMTemplate
//
//  Created by Medyannik Dmitri on 28.07.2020.
//  Copyright © 2020 Medyannik Dmitri. All rights reserved.
//

import CoreData
import UIKit

final class CoreDataManeger {
    lazy var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "EventsApp")
        persistentContainer.loadPersistentStores { (_, error) in
            print(error?.localizedDescription ?? "")
        }
        return persistentContainer
    }()
    
    var moc: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func saveEvent(name: String, date: Date, image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 1) else { return }
        let event = Event(context: moc)
        event.setValue(name, forKey: "name")
        event.setValue(date, forKey: "date")
        event.setValue(imageData, forKey: "image")
        
        do {
            try moc.save()
        } catch {
            print(error)
        }
    }
    
    func fetchEvents() -> [Event] {
        do {
            let fetchRequest = NSFetchRequest<Event>(entityName: "Event")
            let events = try moc.fetch(fetchRequest)
            return events
        } catch {
            print(error)
            return []
        }
    }
}
