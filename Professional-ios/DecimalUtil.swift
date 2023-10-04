//
//  DecimalUtil.swift
//  Professional-ios
//
//  Created by Abhishek Gupta on 22/09/23.
//
import Foundation

extension Decimal{
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
