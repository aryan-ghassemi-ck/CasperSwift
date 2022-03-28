//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

@testable import CasperSwift
import XCTest

class HashServiceTests: XCTestCase {
    
    private static let ED25519publicKey = "01381b36cd07ad85348607ffe0fa3a2d033ea941d14763358ebeace9c8ad3cb771";
    private static let ED25519hash = "07b30fdd279f21d29ab1922313b56ad3905e7dd6a654344b8012e0be9fefa51b";
    
    func testValidBlakeEd25519() throws {
        let hash = try HashService().getAccountHash(accountKey: Self.ED25519publicKey)
        XCTAssertEqual(hash, Self.ED25519hash)
    }
}
