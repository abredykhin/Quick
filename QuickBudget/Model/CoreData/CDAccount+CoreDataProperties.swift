//
//  CDAccount+CoreDataProperties.swift
//  QuickBudget
//
//  Created by Anton Bredykhin on 9/23/19.
//  Copyright © 2019 Anton Bredykhin. All rights reserved.
//
//

import Foundation
import CoreData


extension CDAccount {

    @nonobjc public class func accountFetchRequest() -> NSFetchRequest<CDAccount> {
        return NSFetchRequest<CDAccount>(entityName: "CDAccount")
    }

    @NSManaged public var accountId: String?
    @NSManaged public var mask: String?
    @NSManaged public var name: String?
    @NSManaged public var subtype: String?
    @NSManaged public var type: String?
    @NSManaged public var balances: CDAccountBalances?
    @NSManaged public var bank: CDBank?
    @NSManaged public var bills: NSSet?
    @NSManaged public var incomes: NSSet?
    @NSManaged public var transactions: NSSet?
    @NSManaged public var users: NSSet?

}

// MARK: Generated accessors for bills
extension CDAccount {

    @objc(addBillsObject:)
    @NSManaged public func addToBills(_ value: CDRecurringBill)

    @objc(removeBillsObject:)
    @NSManaged public func removeFromBills(_ value: CDRecurringBill)

    @objc(addBills:)
    @NSManaged public func addToBills(_ values: NSSet)

    @objc(removeBills:)
    @NSManaged public func removeFromBills(_ values: NSSet)

}

// MARK: Generated accessors for incomes
extension CDAccount {

    @objc(addIncomesObject:)
    @NSManaged public func addToIncomes(_ value: CDIncome)

    @objc(removeIncomesObject:)
    @NSManaged public func removeFromIncomes(_ value: CDIncome)

    @objc(addIncomes:)
    @NSManaged public func addToIncomes(_ values: NSSet)

    @objc(removeIncomes:)
    @NSManaged public func removeFromIncomes(_ values: NSSet)

}

// MARK: Generated accessors for transactions
extension CDAccount {

    @objc(addTransactionsObject:)
    @NSManaged public func addToTransactions(_ value: CDTransaction)

    @objc(removeTransactionsObject:)
    @NSManaged public func removeFromTransactions(_ value: CDTransaction)

    @objc(addTransactions:)
    @NSManaged public func addToTransactions(_ values: NSSet)

    @objc(removeTransactions:)
    @NSManaged public func removeFromTransactions(_ values: NSSet)

}

// MARK: Generated accessors for users
extension CDAccount {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: CDUser)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: CDUser)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}
