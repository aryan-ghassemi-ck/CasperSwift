//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/26/22.
//

import Foundation

public class ChainGetBlockRequest: JsonRpcNetworkRequest<ChainGetBlockResult> {
    public convenience init(blockIdentifier: BlockIdentifier, environment: CasperEnvironment = .mainnet) {
        self.init(url: environment.url, method: "chain_get_block", param: blockIdentifier.parameterValue)
    }
}

public enum BlockIdentifier {
    case hash(String)
    case height(Int)
    
    var parameterValue: [String: AnyEncodable] {
        switch self {
        case .hash(let hash):
            return ["block_identifier": ["Hash": hash]]
        case .height(let height):
            return ["block_identifier": ["Height": height]]
        }
    }
}

public struct ChainGetBlockResult: Decodable {
    public let apiVersion: String
    public let block: Block
}

public struct Block: Decodable {
    public let header: Header
    public let body: Body
    public let proofs: [Proof]
}

extension Block {
    public struct Header: Decodable {
        public let parentHash: String
        public let stateRootHash: String
        public let bodyHash: String
        public let randomBit: Bool
        public let accumulatedSeed: String
        public let eraEnd: String?
        public let timestamp: String
        public let eraId: Int
        public let height: Int
        public let protocolVersion: String
    }
}

public struct Body: Decodable {
    public let proposer: String
    public let deployHashes: [String]
    public let transferHashes: [String]
}

public struct Proof: Decodable {
    public let publicKey: String
    public let signature: String
}
