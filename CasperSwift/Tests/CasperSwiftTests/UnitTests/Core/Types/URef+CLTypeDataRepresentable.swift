//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 4/2/22.
//

@testable import CasperSwift
import XCTest

class URefCLTypeDataRepresentable: XCTestCase {

    func testUref() throws {
        let urefAddress = "2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a"
        
        let expected = "022a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a07"
            .hexDecodedData
        
        let uref = URef(hexString: urefAddress, accessRights: .readAddWrite)
        
        let bytes = try uref.serialize()
        
        XCTAssertEqual(bytes, expected)
    }
}
