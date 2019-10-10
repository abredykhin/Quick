//
//  LinkAccountsModel.swift
//  QuickBudget
//
//  Created by Anton Bredykhin on 8/23/19.
//  Copyright © 2019 Anton Bredykhin. All rights reserved.
//

import SwiftUI
import Combine
import CoreData

import LinkKit
import Firebase
import RxFirebaseFirestore
import RxFirebaseAuthentication
import RxFirebaseFunctions
import RxSwift
import RxCocoa

final class LinkAccountModel: ObservableObject {
    private var disposeBag = DisposeBag()
    private var managedObjectContext: NSManagedObjectContext
    
    @Published var currentError = ""
    @Published var currentlyLinking = false
    @Published var hasAccounts = false
    
    init(managedContext: NSManagedObjectContext) {
        self.managedObjectContext = managedContext
    }
    
    func linkNewBank(publicToken: String, metadata: [String:Any]?) {
        guard let metadata = metadata else { return }
        
        let cdBank = CDBank.fromMetadata(metadata["institution"] as! [String: Any], context: managedObjectContext)
        var cdBankAccounts = [CDAccount]()
        
        let accountsListMetadata = metadata["accounts"] as! [[String: Any]]
        for accountMetadata in accountsListMetadata {
            let cdAccount = CDAccount.fromMetadata(accountMetadata, context: managedObjectContext)
            cdBank.addToAccounts(cdAccount)
            cdBankAccounts.append(cdAccount)
        }
        
        do {
            try managedObjectContext.save()
            hasAccounts = true
        } catch {
            self.currentError = "Unable to link accounts"
            print("Unable to save accounts data: \(error)")
        }                
    }
    
    func provisionBank(cdBank: CDBank, publicToken: String) {
        let functionParams = [Constants.Functions.Params.publicToken: publicToken,
                              Constants.Functions.Params.bankId: cdBank.bankId!]

        // TODO: use in debug only. Also remove arbitrary loads in Plist.info
        //        functions.useFunctionsEmulator(origin: "http://localhost:5001")
        Functions.functions()
            .httpsCallable(Constants.Functions.addBank)
            .rx
            .call(functionParams)
            .subscribe(
                onNext: { [weak self] result in
                    guard let self = self else { return }

                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    if let response = result.data as? [String: Any] {
                        if let fbBankMeta = response["bank"] as? String, let fbBankData = fbBankMeta.data(using: .utf8) {
                            if let fbBank = try? decoder.decode(FBBank.self, from: fbBankData) {
                                cdBank.logo = fbBank.logo
                                cdBank.primaryColor = fbBank.primaryColor
                                cdBank.isProvisioned = true
                            }
                        }
                        
                        if let fbAccounts = response["accounts"] as? String, let fbAccountData = fbAccounts.data(using: .utf8) {
                            if let fbAccountList = try? decoder.decode([FBAccount].self, from: fbAccountData) {
                                for fbAccount in fbAccountList {
                                    if let fbBalances = fbAccount.balances, let cdAccount = cdBank.accounts?.first(where: { ($0 as! CDAccount).accountId == fbAccount.accountId }) as? CDAccount{
                                        
                                        let cdBalances = CDAccountBalances(context: self.managedObjectContext)
                                        cdBalances.available = fbBalances.available?.decimalValue()
                                        cdBalances.current = fbBalances.current?.decimalValue()
                                        cdBalances.limit = fbBalances.limit?.decimalValue()
                                        cdBalances.currencyCode = fbBalances.currencyCode
                                        cdBalances.account = cdAccount
                                    }
                                }
                            }
                        }
                        
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print("Unable to store bank updates: \(error)")
                        }
                    } else {
                        
                    }
                },
                onError: { err in
                    print("Unable to add bank: \(err)")
                }
            ).disposed(by: disposeBag)
    }
}


struct FBBank: Codable {
    var url: String?
    var primaryColor: String?
    var logo: String?
    
    enum CodingKeys: String, CodingKey {
        case url
        case primaryColor
        case logo
    }
}

struct FBAccount: Codable {
    var accountId: String
    var balances: FBAccountBalances?
    
    struct FBAccountBalances: Codable {
        var available: String?
        var current: String?
        var limit: String?
        var currencyCode: String?
    }
}
