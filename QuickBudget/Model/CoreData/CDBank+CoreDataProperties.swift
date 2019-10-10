//
//  CDBank+CoreDataProperties.swift
//  QuickBudget
//
//  Created by Anton Bredykhin on 9/23/19.
//  Copyright © 2019 Anton Bredykhin. All rights reserved.
//
//

import Foundation
import CoreData


extension CDBank {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDBank> {
        return NSFetchRequest<CDBank>(entityName: "CDBank")
    }

    @NSManaged public var bankId: String?
    @NSManaged public var isProvisioned: Bool
    @NSManaged public var logo: String?
    @NSManaged public var name: String?
    @NSManaged public var primaryColor: String?
    @NSManaged public var token: String?
    @NSManaged public var accounts: NSSet?

}

// MARK: Generated accessors for accounts
extension CDBank {

    @objc(addAccountsObject:)
    @NSManaged public func addToAccounts(_ value: CDAccount)

    @objc(removeAccountsObject:)
    @NSManaged public func removeFromAccounts(_ value: CDAccount)

    @objc(addAccounts:)
    @NSManaged public func addToAccounts(_ values: NSSet)

    @objc(removeAccounts:)
    @NSManaged public func removeFromAccounts(_ values: NSSet)

}
