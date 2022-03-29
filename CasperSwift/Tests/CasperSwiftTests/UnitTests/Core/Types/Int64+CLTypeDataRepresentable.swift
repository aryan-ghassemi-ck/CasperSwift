//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/28/22.
//

@testable import CasperSwift
import XCTest

class Int64CLTypeDataRepresentable: XCTestCase {

    func testInt64() throws {
        XCTAssertEqual(try Int64(198572906121139257).serialize().bytes, [57, 20, 94, 139, 1, 121, 193, 2])
        XCTAssertEqual(try Int64(-4009477689550808).serialize().bytes, [40, 88, 148, 186, 102, 193, 241, 255])
    }
}
