//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 4/3/22.
//

@testable import CasperSwift
import XCTest

class CLPublicKeyTests: XCTestCase {
    
    func testPublicKey() throws {
        let key: [UInt8] = [
            161, 154, 207, 105, 157, 211, 135, 135,
            131, 191, 194, 208, 139, 29, 117, 39, 180, 73, 129,
            68, 8, 47, 215, 174, 210, 233, 207, 3, 158, 209, 237, 82
        ]
        
        let expected = [1] + key // Algo + key bytes
        let publicKey = CLPublicKey(bytes: key, algorithm: .ED25519)
        XCTAssertEqual(try publicKey.serialize().bytes, expected)
    }
}
