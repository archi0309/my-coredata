//
//  Users+CoreDataProperties.swift
//  my-coredata
//
//  Created by Kochi Lin on 12/16/16.
//  Copyright © 2016 Kochi Lin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Users {

    @NSManaged var username: String?
    @NSManaged var password: String?

}
