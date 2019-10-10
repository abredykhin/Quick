//
//  CDTransaction+CoreDataProperties.swift
//  QuickBudget
//
//  Created by Anton Bredykhin on 9/18/19.
//  Copyright © 2019 Anton Bredykhin. All rights reserved.
//
//

import Foundation
import CoreData


extension CDTransaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDTransaction> {
        return NSFetchRequest<CDTransaction>(entityName: "CDTransaction")
    }

    @NSManaged public var amount: NSDecimalNumber?
    @NSManaged public var category: String?
    @NSManaged public var currencyCode: String?
    @NSManaged public var date: Date?
    @NSManaged public var isPending: Bool
    @NSManaged public var location: String?
    @NSManaged public var name: String?
    @NSManaged public var account: CDAccount?
    @NSManaged public var users: NSSet?

}

// MARK: Generated accessors for users
extension CDTransaction {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: CDUser)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: CDUser)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}
