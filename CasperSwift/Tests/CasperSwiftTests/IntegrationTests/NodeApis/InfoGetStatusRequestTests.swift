//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

@testable import CasperSwift
import XCTest

class InfoGetStatusRequestTests: XCTestCase {
    
    let casperClient = CasperNodeClient(session: URLSession.shared, environment: .testnet)
 
    func testGetStatus() async throws {
        let nodeStatus = try await casperClient.getNodeStatus()
        XCTAssertEqual(nodeStatus.chainspecName, "casper-test")
    }
}
