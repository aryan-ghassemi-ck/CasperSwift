//
//  BalanceRequest.swift
//  CasperDemo
//
//  Created by Aryan Ghassemi on 3/20/22.
//

import Foundation

public class StateGetBalanceRequest: JsonRpcNetworkRequest<StateGetBalanceResult> {
    public convenience init(params: StateGetBalanceParameters) {
        self.init(url: CasperEndpoint.node ,method: "state_get_balance", param: params)
    }
}

public struct StateGetBalanceParameters: Codable {
    public let purseUref: String
    public let stateRootHash: String
    
    public init(purseUref: String, stateRootHash: String) {
        self.purseUref = purseUref
        self.stateRootHash = stateRootHash
    }
}

public struct StateGetBalanceResult: Decodable {
    public let apiVersion: String
    public let balanceValue: String
    // public let merkleProof: String
}
