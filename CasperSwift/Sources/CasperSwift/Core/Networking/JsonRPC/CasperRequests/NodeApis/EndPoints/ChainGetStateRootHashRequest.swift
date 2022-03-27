//
//  RootHashRequest.swift
//  CasperDemo
//
//  Created by Aryan Ghassemi on 3/20/22.
//

import Foundation

public class ChainGetStateRootHashRequest: JsonRpcNetworkRequest<ChainGetStateRootHashResult> {
    public convenience init(blockIdentifier: BlockIdentifier? = nil, environment: CasperEnvironment = .mainnet) {
        self.init(url: environment.url, method: "chain_get_state_root_hash", param: blockIdentifier?.parameterValue)
    }
}

public struct ChainGetStateRootHashResult: Decodable {
    public let apiVersion: String
    public let stateRootHash: String
}
