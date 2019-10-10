//
//  PlaidLinkWrapper.swift
//  QuickBudget
//
//  Created by Anton Bredykhin on 8/23/19.
//  Copyright © 2019 Anton Bredykhin. All rights reserved.
//

import SwiftUI
import UIKit

import LinkKit

struct PlaidLinkWrapper: UIViewControllerRepresentable {
    var model: LinkAccountModel
     
    func makeCoordinator() -> PlaidLinkWrapperCoordinator {
        return PlaidLinkWrapperCoordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PlaidLinkWrapper>) -> UIViewController {
        return PLKPlaidLinkViewController(delegate: context.coordinator)
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<PlaidLinkWrapper>) {
        
    }
    
    class PlaidLinkWrapperCoordinator : NSObject, PLKPlaidLinkViewDelegate {
        var parent: PlaidLinkWrapper
        
        init(_ wrapper: PlaidLinkWrapper) {
            self.parent = wrapper
        }
        
        func linkViewController(_ linkViewController: PLKPlaidLinkViewController, didSucceedWithPublicToken publicToken: String, metadata: [String : Any]?) {
            print("Plaid success. Here's metadata \(metadata as AnyObject)")
            self.parent.model.linkNewBank(publicToken: publicToken, metadata: metadata)
            self.parent.model.currentlyLinking = false
        }
        
        func linkViewController(_ linkViewController: PLKPlaidLinkViewController, didExitWithError error: Error?, metadata: [String : Any]?) {
            print("Plaid fail. Here's metadata \(metadata as AnyObject)")
        }
    }
}
