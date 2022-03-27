//
//  AccountRequest.swift
//  CasperDemo
//
//  Created by Aryan Ghassemi on 3/20/22.
//

import Foundation

public class StateGetItemRequest: JsonRpcNetworkRequest<StateGetItemResult> {
    public convenience init(params: StateGetItemParameters) {
        self.init(url: CasperEndpoint.node ,method: "state_get_item", param: params)
    }
}

public struct StateGetItemParameters: Codable {
    public let key: String
    public let stateRootHash: String
    
    public init(keyRepresentable: KeyRepresentable, stateRootHash: String) {
        self.key = keyRepresentable.key
        self.stateRootHash = stateRootHash
    }
    
    public enum KeyRepresentable {
        case publicKey(String)
        case accountHash(String)
        case contractAddress(String)
        case uref(String)
        case transfer(String)
        case deployInfo(String)
        
        var key: String {
            switch self {
            case .accountHash(let key):
                return "account-hash-\(key)"
            case .publicKey(let key):
                return key
            default:
                return "TODO"
            }
        }
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
