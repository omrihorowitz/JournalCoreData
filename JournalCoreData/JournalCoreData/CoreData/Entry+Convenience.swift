//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by Omri Horowitz on 1/18/21.
//

import CoreData

extension Entry {
    @discardableResult convenience init(title: String, bodytext: String, timestamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.bodytext = bodytext
        self.timestamp = timestamp
    }
}

extension Entry {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        lhs.timestamp == rhs.timestamp
    
    }
}
