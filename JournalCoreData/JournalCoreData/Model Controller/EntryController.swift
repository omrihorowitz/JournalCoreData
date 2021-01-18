//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Omri Horowitz on 1/18/21.
//

import CoreData

class EntryController {
    
    static let shared = EntryController()
    
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    func createEntry(title: String, bodytext: String) {
        Entry(title: title, bodytext: bodytext)
        CoreDataStack.saveContext()
    }
    func fetchEntries() {
        self.entries = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    func updateEntry(entry: Entry, title: String, bodytext: String) {
        entry.title = title
        entry.bodytext = bodytext
        CoreDataStack.saveContext()
    }
    func deleteEntry(entryToDelete: Entry) {
        guard let indexToDelete = entries.firstIndex(of: entryToDelete) else { return }
        entries.remove(at: indexToDelete)
        CoreDataStack.saveContext()
    }
}

