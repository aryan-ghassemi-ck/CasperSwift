//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/28/22.
//

@testable import CasperSwift
import XCTest

class UInt8CLTypeDataRepresentableTests: XCTestCase {

    func testUint8() throws {
        XCTAssertEqual(try UInt8(0x08).serialize().bytes, [8])
        XCTAssertEqual(try UInt8(0xff).serialize().bytes, [255])
        XCTAssertEqual(try UInt8(0x0a).serialize().bytes, [10])
    }
}
