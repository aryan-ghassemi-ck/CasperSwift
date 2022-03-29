//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

@testable import CasperSwift
import XCTest

class StringCLTypeDataRepresentableTests: XCTestCase {

    func testString() throws {
        XCTAssertEqual(
            try "test_测试".serialize().bytes,
            [11, 0, 0, 0, 116, 101, 115, 116, 95, 230, 181, 139, 232, 175, 149]
        )
    }
    
    func testEmptyString() {
        XCTAssertEqual(try "".serialize().bytes, [0, 0, 0, 0])
    }
}
