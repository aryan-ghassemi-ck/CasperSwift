//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/28/22.
//

@testable import CasperSwift
import XCTest

class UInt32CLTypeDataRepresentableTests: XCTestCase {

    func testU32() throws {
        XCTAssertEqual(try CLValue(clType: .U32(1024)).bytes, "00040000")
        XCTAssertEqual(try CLValue(clType: .U32(2048)).bytes, "00080000")
        XCTAssertEqual(try CLValue(clType: .U32(2049)).bytes, "01080000")
        XCTAssertEqual(try CLValue(clType: .U32(0xf0e0_d0c0)).bytes, "c0d0e0f0")
        XCTAssertEqual(try UInt32(100000).serialize().bytes, [160, 134, 1, 0])
    }
}
