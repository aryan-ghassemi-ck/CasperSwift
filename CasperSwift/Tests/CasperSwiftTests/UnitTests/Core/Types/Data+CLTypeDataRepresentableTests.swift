//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/28/22.
//

@testable import CasperSwift
import XCTest

class DataCLTypeDataRepresentableTests: XCTestCase {
    
    func testByteArray() throws {
        XCTAssertEqual(try CLValue(clType: .BytesArray(Data())).bytes, "00000000")
        XCTAssertEqual(try CLValue(clType: .BytesArray(Data([1, 2, 3]))).bytes, "03000000010203")
    }
}
