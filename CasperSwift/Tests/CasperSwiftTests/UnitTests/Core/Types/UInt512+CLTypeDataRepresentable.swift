//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 4/2/22.
//

@testable import CasperSwift
import XCTest

class UInt512CLTypeDataRepresentable: XCTestCase {

    func testUInt512() throws {
        XCTAssertEqual(try CLValue(clType: .U512(UInt512("10000000000"))).bytes, "0500e40b5402")
        XCTAssertEqual(try CLValue(clType: .U512(UInt512("1000000000"))).bytes, "0400ca9a3b")
    }
}
