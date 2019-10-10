//
//  CDUser+CoreDataProperties.swift
//  QuickBudget
//
//  Created by Anton Bredykhin on 9/18/19.
//  Copyright © 2019 Anton Bredykhin. All rights reserved.
//
//

import Foundation
import CoreData


extension CDUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUser> {
        return NSFetchRequest<CDUser>(entityName: "CDUser")
    }

    @NSManaged public var name: String?
    @NSManaged public var accounts: NSSet?
    @NSManaged public var balances: NSSet?
    @NSManaged public var bills: NSSet?
    @NSManaged public var transactions: NSSet?

}

// MARK: Generated accessors for accounts
extension CDUser {

    @objc(addAccountsObject:)
    @NSManaged public func addToAccounts(_ value: CDAccount)

    @objc(removeAccountsObject:)
    @NSManaged public func removeFromAccounts(_ value: CDAccount)

    @objc(addAccounts:)
    @NSManaged public func addToAccounts(_ values: NSSet)

    @objc(removeAccounts:)
    @NSManaged public func removeFromAccounts(_ values: NSSet)

}

// MARK: Generated accessors for balances
extension CDUser {

    @objc(addBalancesObject:)
    @NSManaged public func addToBalances(_ value: CDAccountBalances)

    @objc(removeBalancesObject:)
    @NSManaged public func removeFromBalances(_ value: CDAccountBalances)

    @objc(addBalances:)
    @NSManaged public func addToBalances(_ values: NSSet)

    @objc(removeBalances:)
    @NSManaged public func removeFromBalances(_ values: NSSet)

}

// MARK: Generated accessors for bills
extension CDUser {

    @objc(addBillsObject:)
    @NSManaged public func addToBills(_ value: CDRecurringBill)

    @objc(removeBillsObject:)
    @NSManaged public func removeFromBills(_ value: CDRecurringBill)

    @objc(addBills:)
    @NSManaged public func addToBills(_ values: NSSet)

    @objc(removeBills:)
    @NSManaged public func removeFromBills(_ values: NSSet)

}

// MARK: Generated accessors for transactions
extension CDUser {

    @objc(addTransactionsObject:)
    @NSManaged public func addToTransactions(_ value: CDTransaction)

    @objc(removeTransactionsObject:)
    @NSManaged public func removeFromTransactions(_ value: CDTransaction)

    @objc(addTransactions:)
    @NSManaged public func addToTransactions(_ values: NSSet)

    @objc(removeTransactions:)
    @NSManaged public func removeFromTransactions(_ values: NSSet)

}
