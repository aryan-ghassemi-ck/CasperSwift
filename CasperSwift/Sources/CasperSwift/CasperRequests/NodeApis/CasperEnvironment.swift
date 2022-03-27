//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

import Foundation

public enum CasperEnvironment {
    case mainnet
    case testnet
    
    var url: URL {
        switch self {
        case .mainnet:
            return URL(string: "https://node-clarity-mainnet.make.services/rpc")!
        case .testnet:
            return URL(string: "https://node-clarity-testnet.make.services/rpc")!
        }
    }
}
