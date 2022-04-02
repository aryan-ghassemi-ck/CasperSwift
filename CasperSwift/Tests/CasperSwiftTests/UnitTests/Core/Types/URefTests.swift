//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 4/2/22.
//

@testable import CasperSwift
import XCTest

class URefTests: XCTestCase {
    
    func testUref() throws {
        let uref = try URef(urefString: "uref-ebda3f171068107470bce0d74eb9a302fcb8914471fe8900c66fae258a0f46ef-007")
        
        XCTAssertEqual(uref.accessRights, .readAddWrite)
        
        XCTAssertEqual(Data(uref.bytes).hexEncodedString, "ebda3f171068107470bce0d74eb9a302fcb8914471fe8900c66fae258a0f46ef")
    }
}
