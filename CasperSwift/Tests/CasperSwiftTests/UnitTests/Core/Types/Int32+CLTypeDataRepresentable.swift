//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/28/22.
//

@testable import CasperSwift
import XCTest

class Int32CLTypeDataRepresentable: XCTestCase {

    func testInt32() throws {
        XCTAssertEqual(try Int32(-100000).serialize().bytes, [96, 121, 254, 255])
        XCTAssertEqual(try Int32(100000).serialize().bytes, [160, 134, 1, 0])
        XCTAssertEqual(try Int32(0).serialize().bytes, [0, 0, 0, 0])
        XCTAssertEqual(try Int32(-1).serialize().bytes, [255, 255, 255, 255])
    }
}
