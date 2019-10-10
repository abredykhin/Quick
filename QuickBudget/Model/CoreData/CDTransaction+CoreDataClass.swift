//
//  CDTransaction+CoreDataClass.swift
//  QuickBudget
//
//  Created by Anton Bredykhin on 9/18/19.
//  Copyright © 2019 Anton Bredykhin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(CDTransaction)
public class CDTransaction: NSManagedObject {

}

extension CDTransaction {
    private class var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }
    
    class func fromMetadata(_ metadata: [String: Any], context: NSManagedObjectContext) -> CDTransaction {
        let transaction = CDTransaction(context: context)
        transaction.amount = (metadata["amount"] as? String).decimalValue()
        transaction.name = metadata["name"] as? String
        transaction.category = metadata["category"] as? String
        transaction.currencyCode = metadata["iso_currency_code"] as? String
        transaction.location = metadata["location"] as? String
        transaction.isPending = metadata["pending"] as? Bool ?? false
        
        if let date = metadata["date"] as? String {
            transaction.date = dateFormatter.date(from: date)
        }
        
        return transaction
    }
}
