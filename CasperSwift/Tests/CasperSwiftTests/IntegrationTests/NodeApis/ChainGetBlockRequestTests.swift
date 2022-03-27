//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

import Foundation

@testable import CasperSwift
import XCTest

class ChainGetBlockRequestTests: XCTestCase {
    
    let casperClient = CasperNodeClient(session: URLSession.shared, environment: .testnet)
    
    func testGetBlockByHash() async throws {
        // https://testnet.cspr.live/block/15cd44063cb1cdb7a2a2cf11c27923014ca1f9957dcb362c50bf9b5a9ea12e10
        let blockHash = "15cd44063cb1cdb7a2a2cf11c27923014ca1f9957dcb362c50bf9b5a9ea12e10"
        let block = try await casperClient.getBlock(blockIdentifier: .hash(blockHash))
        
        XCTAssertEqual(block.header.stateRootHash, "2203a870d49aa86a465edb91ae48db2863d375c3e4b9589819360d414816d136")
        XCTAssertEqual(block.header.bodyHash, "441bc4f8a9f0323db4841d43e9afaf584e8098275f5ada3768629f147b886ba6")
        XCTAssertEqual(block.header.parentHash, "0558749eefeaba5b5c6afc9e0c8bd00cd4222f2965dd3dcaa7de5cc2c5f3db80")
        XCTAssertEqual(block.header.height, 645539)
        XCTAssertEqual(block.header.eraId, 4223)
        XCTAssertEqual(block.header.timestamp, "2022-03-27T16:01:34.208Z")
    }
    
    func testGetBlockByHeight() async throws {
        // https://testnet.cspr.live/block/975ea4de188c2a67946188cea0ec8a93d2d38286d7642526d50c45839a291210
        let block = try await casperClient.getBlock(blockIdentifier: .height(0))
        
        XCTAssertEqual(block.header.stateRootHash, "e88b7c061760134ba37ad312c1e2d6373121748e9c61bcea19cc57510829addf")
        XCTAssertEqual(block.header.bodyHash, "51fce4a5f583a63b30fc25199fe8a573e5e82779f996caec01894d92e8cf0f3b")
        XCTAssertEqual(block.header.parentHash, "0000000000000000000000000000000000000000000000000000000000000000")
        XCTAssertEqual(block.header.height, 0)
        XCTAssertEqual(block.header.eraId, 0)
        XCTAssertEqual(block.header.timestamp, "2021-04-08T17:00:56.704Z")
    }
}
