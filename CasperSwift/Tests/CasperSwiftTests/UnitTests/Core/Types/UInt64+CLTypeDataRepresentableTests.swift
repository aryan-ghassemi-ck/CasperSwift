//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/28/22.
//

@testable import CasperSwift
import XCTest

class UInt64CLTypeDataRepresentableTests: XCTestCase {

    func testU64() throws {
        XCTAssertEqual(try CLValue(clType: .U64(0)).bytes, "0000000000000000")
        XCTAssertEqual(try CLValue(clType: .U64(1)).bytes, "0100000000000000")
        XCTAssertEqual(try CLValue(clType: .U64(1234)).bytes, "d204000000000000")
        XCTAssertEqual(try CLValue(clType: .U64(18446744073709551615)).bytes, "ffffffffffffffff")
        
        XCTAssertEqual(try CLValue(clType: .U64(1234)).bytes, "d204000000000000")
        XCTAssertEqual(try CLValue(clType: .U64(0x01020304)).bytes, "0403020100000000")
        XCTAssertEqual(try CLValue(clType: .U64(0x0102030405)).bytes, "0504030201000000")
    }
}
