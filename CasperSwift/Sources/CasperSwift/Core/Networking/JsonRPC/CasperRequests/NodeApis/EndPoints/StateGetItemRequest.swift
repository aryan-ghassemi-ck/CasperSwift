//
//  AccountRequest.swift
//  CasperDemo
//
//  Created by Aryan Ghassemi on 3/20/22.
//

import Foundation

public class StateGetItemRequest: JsonRpcNetworkRequest<StateGetItemResult> {
    public convenience init(params: StateGetItemParameters, environment: CasperEnvironment = .mainnet) {
        self.init(url: environment.url ,method: .stateGetItem, param: params)
    }
}

public struct StateGetItemParameters: Codable {
    public let key: String
    public let stateRootHash: String
    
    public init(hashType: HashType, stateRootHash: String) {
        self.key = hashType.value
        self.stateRootHash = stateRootHash
    }
}

public struct StateGetItemResult: Decodable {
    public let apiVersion: String
    // public let merkleProof: String
    public let storedValue: StoredValue
}

public struct StoredValue: Decodable {
    // Json is capital letter, find on decoder instead
    public let Account: Account
}

public struct Account: Decodable {
    public let accountHash: String
    public let mainPurse: String
    public let actionThresholds: ActionThreshold
    public let associatedKeys: [AssociatedKey]
}

public struct ActionThreshold: Decodable {
    public let deployment: Int
    public let keyManagement: Int
}

public struct AssociatedKey: Decodable {
    public let accountHash: String
    public let weight: Int
}
