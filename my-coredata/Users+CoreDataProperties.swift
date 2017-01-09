//
//  Users+CoreDataProperties.swift
//  my-coredata
//
//  Created by Kochi Lin on 1/9/17.
//  Copyright © 2017 Kochi Lin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Users {

    @NSManaged var avatar: NSData?
    @NSManaged var gender: NSNumber?
    @NSManaged var height: NSNumber?
    @NSManaged var month: NSNumber?
    @NSManaged var name: String?
    @NSManaged var pace: NSNumber?
    @NSManaged var weight: NSNumber?
    @NSManaged var year: NSNumber?
    @NSManaged var ecgs: NSOrderedSet?

}
