//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

import Foundation

public struct CasperNodeClient {
    
    private let session: URLSession
    private let environment: CasperEnvironment
    
    public init(session: URLSession, environment: CasperEnvironment) {
        self.session = session
        self.environment = environment
    }
    
    public func getStateRootHash(blockIdentifier: BlockIdentifier? = nil) async throws -> String {
        let result = try await session.request(from: ChainGetStateRootHashRequest(
            blockIdentifier: blockIdentifier,
            environment: environment))

        return result.stateRootHash
    }
    
    public func getBlock(blockIdentifier: BlockIdentifier) async throws -> Block {
        let request = ChainGetBlockRequest(
            blockIdentifier: blockIdentifier,
            environment: environment)
        
        return try await session.request(from: request).block
    }
    
    public func getNodeStatus() async throws -> InfoGetStatusResult {
        try await session.request(from: InfoGetStatusRequest(environment: environment))
    }
    
    public func getPeers() async throws -> [Peer] {
        try await session.request(from: InfoGetPeersRequest(environment: environment)).peers
    }
    
    public func getAuctionState() async throws -> AuctionState {
        try await session.request(from: StateGetAuctionInfoRequest(environment: environment)).auctionState
    }
    
    public func getBalance(purseUref: String, stateRootHash: String) async throws -> String {
        let request = StateGetBalanceRequest(
            params: StateGetBalanceParameters(purseUref: purseUref, stateRootHash: stateRootHash),
            environment: environment)
        
        return try await session.request(from: request).balanceValue
    }
    
    public func getStoredValue(hashType: HashType, stateRootHash: String) async throws -> StoredValue {
        let request = StateGetItemRequest(
            params: StateGetItemParameters(hashType: hashType, stateRootHash: stateRootHash),
            environment: environment)
        
        return try await session.request(from: request).storedValue
    }
}
