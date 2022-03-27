//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

@testable import CasperSwift
import XCTest

class InfoGetPeersRequestTests: XCTestCase {
    
    let casperClient = CasperNodeClient(session: URLSession.shared, environment: .testnet)
 
    func testGetPeers() async throws {
        let peers = try await casperClient.getPeers()
        XCTAssertTrue(peers.count > 0)
    }
}
