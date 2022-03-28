//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

@testable import CasperSwift
import XCTest

class CLValueTests: XCTestCase {
    
    func testBool() throws {
        let clValueTrue = try CLValue(clType: .Bool(true))
        XCTAssertEqual(clValueTrue.bytes, "01")
        
        let clValueFalse = try CLValue(clType: .Bool(false))
        XCTAssertEqual(clValueFalse.bytes, "00")
    }
    
    func testString() throws {
        let clValue = try CLValue(clType: .String("send"))
        XCTAssertEqual(clValue.bytes, "0400000053656e64")
    }
    
    func testU32() throws {
        XCTAssertEqual(try CLValue(clType: .U32(1024)).bytes, "00040000")
        XCTAssertEqual(try CLValue(clType: .U32(2048)).bytes, "00080000")
        XCTAssertEqual(try CLValue(clType: .U32(2049)).bytes, "01080000")
        // TODO:
        // assertThat(serializer.serialize(0xf0e0_d0c0), is(decodeHex( "c0d0e0f0")));
        // assertThat(serializer.serialize(100000), is(new byte[]{(byte) 160, (byte) 134, 1, 0}));
    }
}
