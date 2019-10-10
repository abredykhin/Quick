//
//  CDIncome+CoreDataProperties.swift
//  QuickBudget
//
//  Created by Anton Bredykhin on 9/18/19.
//  Copyright © 2019 Anton Bredykhin. All rights reserved.
//
//

import Foundation
import CoreData


extension CDIncome {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDIncome> {
        return NSFetchRequest<CDIncome>(entityName: "CDIncome")
    }

    @NSManaged public var amount: NSDecimalNumber?
    @NSManaged public var day: Int16
    @NSManaged public var interval: Int16
    @NSManaged public var name: String?
    @NSManaged public var account: CDAccount?

}
