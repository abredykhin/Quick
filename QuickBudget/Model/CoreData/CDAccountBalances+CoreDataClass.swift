//
//  CDAccountBalances+CoreDataClass.swift
//  QuickBudget
//
//  Created by Anton Bredykhin on 9/23/19.
//  Copyright © 2019 Anton Bredykhin. All rights reserved.
//
//

import Foundation
import CoreData


public class CDAccountBalances: NSManagedObject {

}

extension CDAccountBalances {
    class func fromMetadata(_ metadata: [String: Any?], context: NSManagedObjectContext) -> CDAccountBalances {
        print("Adding account balances with meta: \(metadata as AnyObject)")
        
        let balances = CDAccountBalances(context: context)
        balances.available = (metadata["available"] as? String)?.decimalValue()
        balances.currencyCode = metadata["iso_currency_code"] as? String
        balances.current = (metadata["current"] as? String)?.decimalValue()
        balances.limit = (metadata["limit"] as? String)?.decimalValue()
        return balances
    }
}
