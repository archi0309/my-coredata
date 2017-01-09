//
//  ECG+CoreDataProperties.swift
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

extension ECG {

    @NSManaged var create_on: NSDate?
    @NSManaged var name: String?
    @NSManaged var type: String?
    @NSManaged var value: NSNumber?
    @NSManaged var users: Users?

}
