//
//  Users+CoreDataProperties.swift
//  Project 1 - FunZone
//
//  Created by Sevag Gaprielian on 2022-06-05.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var password: String?
    @NSManaged public var username: String?

}

extension Users : Identifiable {

}
