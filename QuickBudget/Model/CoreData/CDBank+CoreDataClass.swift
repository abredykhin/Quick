//
//  CDBank+CoreDataClass.swift
//  QuickBudget
//
//  Created by Anton Bredykhin on 9/23/19.
//  Copyright © 2019 Anton Bredykhin. All rights reserved.
//
//

import Foundation
import CoreData


public class CDBank: NSManagedObject {

}

extension CDBank {
    class func fromMetadata(_ metadata: [String: Any?], context: NSManagedObjectContext) -> CDBank{
        print("Adding bank with meta: \(metadata as AnyObject)")
        let cdBank = CDBank(context: context)
        cdBank.bankId = metadata["institution_id"] as? String
        cdBank.name = metadata["name"] as? String
        return cdBank
    }
}
