//
//  CDAccountBalances+CoreDataProperties.swift
//  QuickBudget
//
//  Created by Anton Bredykhin on 9/23/19.
//  Copyright © 2019 Anton Bredykhin. All rights reserved.
//
//

import Foundation
import CoreData


extension CDAccountBalances {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDAccountBalances> {
        return NSFetchRequest<CDAccountBalances>(entityName: "CDAccountBalances")
    }

    @NSManaged public var available: NSDecimalNumber?
    @NSManaged public var currencyCode: String?
    @NSManaged public var current: NSDecimalNumber?
    @NSManaged public var limit: NSDecimalNumber?
    @NSManaged public var account: CDAccount?
    @NSManaged public var user: CDUser?

}
