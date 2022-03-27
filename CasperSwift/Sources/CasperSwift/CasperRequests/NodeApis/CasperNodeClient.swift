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
}
