//
//  Account+CoreDataProperties.swift
//  docker Manager
//
//  Created by Developer on 17/04/2017.
//  Copyright © 2017 Ingesup. All rights reserved.
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account");
    }

    @NSManaged public var name: String?
    @NSManaged public var url: String?

}
