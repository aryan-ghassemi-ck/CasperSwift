//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 4/2/22.
//

@testable import CasperSwift
import XCTest

class CLAccessRightsTests: XCTestCase {
    
    func testAccessRights() {
        XCTAssertEqual(CLAccessRights.none.bits, 0)
        XCTAssertEqual(CLAccessRights.read.bits, 1)
        XCTAssertEqual(CLAccessRights.write.bits, 2)
        XCTAssertEqual(CLAccessRights.readWrite.bits, 3)
        XCTAssertEqual(CLAccessRights.add.bits, 4)
        XCTAssertEqual(CLAccessRights.readAdd.bits, 5)
        XCTAssertEqual(CLAccessRights.addWrite.bits, 6)
        XCTAssertEqual(CLAccessRights.readAddWrite.bits, 7)
    }
}
