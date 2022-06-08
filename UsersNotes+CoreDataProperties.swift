//
//  UsersNotes+CoreDataProperties.swift
//  Project 1 - FunZone
//
//  Created by Sevag Gaprielian on 2022-05-31.
//
//

import Foundation
import CoreData


extension UsersNotes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UsersNotes> {
        return NSFetchRequest<UsersNotes>(entityName: "UsersNotes")
    }

    @NSManaged public var body: String?
    @NSManaged public var noteId: Int64
    @NSManaged public var title: String?

}

extension UsersNotes : Identifiable {

}
