//
//  CDAccount+CoreDataClass.swift
//  QuickBudget
//
//  Created by Anton Bredykhin on 9/18/19.
//  Copyright © 2019 Anton Bredykhin. All rights reserved.
//
//

import Foundation
import CoreData

public class CDAccount: NSManagedObject {

}

extension CDAccount {
    class func fromMetadata(_ metadata: [String: Any], context: NSManagedObjectContext) -> CDAccount {
        print("Adding account with meta: \(metadata as AnyObject)")
        
        let cdAccount = CDAccount(context: context)
        cdAccount.accountId = metadata["id"] as? String
        cdAccount.mask = metadata["mask"] as? String
        cdAccount.type = metadata["type"] as? String
        cdAccount.subtype = metadata["subtype"] as? String
        
        if let name = metadata["official_name"] as? String {
            cdAccount.name = name
        } else {
            cdAccount.name = metadata["name"] as? String
        }
        
        if let balancesMeta = metadata["balances"] as? [String: Any] {
            let balances = CDAccountBalances.fromMetadata(balancesMeta, context: context)
            balances.account = cdAccount
        }
        do {
            try context.save()
        } catch {
            print("\(error)")
        }
        
        return cdAccount
    }
    
    static func allAccountsFetchRequest() -> NSFetchRequest<CDAccount> {
        let request = CDAccount.accountFetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        return request
    }
}

enum AccountType {
    case depository
    case credit
    case mortgage
    case loan
    case investment
}

enum AccountSubtype {
    case checking
    case creditCard
    case savings
    case _401k
    case car
    case mortgage
}
