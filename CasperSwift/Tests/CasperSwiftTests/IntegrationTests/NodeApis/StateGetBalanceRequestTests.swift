//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

@testable import CasperSwift
import XCTest

class StateGetBalanceRequestTests: XCTestCase {
    
    let casperClient = CasperNodeClient(session: URLSession.shared, environment: .testnet)
 
    func testGetBalance() async throws {
        // state root hash for era 4223
        // https://testnet.cspr.live/block/05e2e90ac8b78bb9bebeb86dd6ee8796d01c33f555e1830e8d8476203e54b17f
        let stateRootHash = "911e6b91f848ef064d33eb3260b571debb0576235b5f622167def5ea178fdf14"
        let accountHash = "8476b3a0951afdf60c9ea7534e7f3f5b81857ec43639341ddfab44e8748011e4"
        
        let state = try await casperClient.getAccountInfo(hashType: .accountHash(accountHash), stateRootHash: stateRootHash)
        let balance = try await casperClient.getBalance(purseUref: state.Account.mainPurse, stateRootHash: stateRootHash)
        XCTAssertEqual(balance, "48582485219591")
    }
}
