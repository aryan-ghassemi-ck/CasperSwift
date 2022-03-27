//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

@testable import CasperSwift
import XCTest

class StateGetAuctionInfoRequestTests: XCTestCase {
    
    let casperClient = CasperNodeClient(session: URLSession.shared, environment: .testnet)
 
    func testGetStatus() async throws {
        let auctionState = try await casperClient.getAuctionState()
        XCTAssertTrue(auctionState.eraValidators.count > 0)
        XCTAssertTrue(auctionState.bids.count > 0)
    }
}
