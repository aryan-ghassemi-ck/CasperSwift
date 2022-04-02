//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 4/2/22.
//

@testable import CasperSwift
import XCTest

class UInt128CLTypeDataRepresentable: XCTestCase {

    func testUInt512() throws {
        XCTAssertEqual(try UInt128("100000").serialize().bytes, [3, 160, 134, 1])
        
//        expected = new byte[]{6, 0, 0, (byte) 0xc0, (byte) 0xd0, (byte) 0xe0, (byte) 0xf0};
//        assertThat(serializer.serialize(0xf0e0_d0c0_0000L), is(expected));
//
//        expected = new byte[]{6, 0, 0, (byte) 0xc0, (byte)  0xd0, (byte) 0xe0, (byte) 0xf0};
//        assertThat(serializer.serialize(0x0000_f0e0_d0c0_0000L), is(expected));
//
//        expected = new byte[]{6, 0, 0, (byte) 0xc0, (byte)  0xd0, (byte) 0xe0, (byte) 0xf0};
//        assertThat(serializer.serialize(0x0000_f0e0_d0c0_0000L), is(expected));
    }
}

