//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

@testable import CasperSwift
import XCTest

class ChainGetStateRootHashRequestTests: XCTestCase {
    
    let casperClient = CasperNodeClient(session: URLSession.shared, environment: .testnet)
    
    func testRootHashWithNoParmas() async throws {
        _ = try await casperClient.getStateRootHash()
    }
    
    func testRootHashWithHash() async throws {
        // https://testnet.cspr.live/block/f569cff73b1f1d00c2631894ab8cf5b6182b5df55722e65d955aa5bf52ea1be2
        let expectedStateRootHash = "2203a870d49aa86a465edb91ae48db2863d375c3e4b9589819360d414816d136"
        let blockHash = "f569cff73b1f1d00c2631894ab8cf5b6182b5df55722e65d955aa5bf52ea1be2"
        let result = try await casperClient.getStateRootHash(blockIdentifier: .hash(blockHash))
        XCTAssertEqual(result, expectedStateRootHash)
    }
    
    func testRootHashWithHeight() async throws {
        // https://testnet.cspr.live/block/f569cff73b1f1d00c2631894ab8cf5b6182b5df55722e65d955aa5bf52ea1be2
        let expectedStateRootHash = "2203a870d49aa86a465edb91ae48db2863d375c3e4b9589819360d414816d136"
        let blockHeight = 645520
        let result = try await casperClient.getStateRootHash(blockIdentifier: .height(blockHeight))
        XCTAssertEqual(result, expectedStateRootHash)
    }
}
