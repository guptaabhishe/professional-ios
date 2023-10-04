//
//  CurrencyFormatterTests.swift
//  Professional-iosUnitTests
//
//  Created by Abhishek Gupta on 04/10/23.
//

import Foundation
import XCTest

@testable import Professional_ios

class Test:XCTestCase{
    var fomatter:CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        fomatter = CurrencyFormatter()
    }
    
    func testBreakIntoDollarAndCents(){
        let result = fomatter.breakIntoDollarsAndCents(929466.23)
        XCTAssertEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "23")
    }
}
