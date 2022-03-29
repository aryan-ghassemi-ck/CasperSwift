//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/28/22.
//

@testable import CasperSwift
import XCTest

class BoolCLTypeDataRepresentableTests: XCTestCase {
    
    func testBoolTrue() throws {
        let clValueTrue = try CLValue(clType: .Bool(true))
        XCTAssertEqual(clValueTrue.bytes, "01")
        
        XCTAssertEqual(try true.serialize(), Data([1]))
    }
    
    func testBoolFalse() throws {
        let clValueFalse = try CLValue(clType: .Bool(false))
        XCTAssertEqual(clValueFalse.bytes, "00")
        
        XCTAssertEqual(try true.serialize(), Data([1]))
    }
}
