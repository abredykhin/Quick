//
//  CDRecurringBill+CoreDataProperties.swift
//  QuickBudget
//
//  Created by Anton Bredykhin on 9/18/19.
//  Copyright © 2019 Anton Bredykhin. All rights reserved.
//
//

import Foundation
import CoreData


extension CDRecurringBill {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDRecurringBill> {
        return NSFetchRequest<CDRecurringBill>(entityName: "CDRecurringBill")
    }

    @NSManaged public var amount: NSDecimalNumber?
    @NSManaged public var day: Int16
    @NSManaged public var interval: Int16
    @NSManaged public var name: String?
    @NSManaged public var account: CDAccount?
    @NSManaged public var users: NSSet?

}

// MARK: Generated accessors for users
extension CDRecurringBill {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: CDUser)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: CDUser)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}
