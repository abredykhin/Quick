//
//  String+Extensions.swift
//  QuickBudget
//
//  Created by Anton Bredykhin on 9/18/19.
//  Copyright © 2019 Anton Bredykhin. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
    func decimalValue() -> NSDecimalNumber? {
        if let self = self {
            return Decimal(string: self) as NSDecimalNumber?
        } else {
            return nil
        }
    }
}

extension String {
    func decimalValue() -> NSDecimalNumber? {
        return Decimal(string: self) as NSDecimalNumber?
    }
}
