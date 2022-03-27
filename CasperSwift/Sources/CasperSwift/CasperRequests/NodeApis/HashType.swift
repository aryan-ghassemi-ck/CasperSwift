//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/26/22.
//

import Foundation

/// https://casper.network/docs/dapp-dev-guide/understanding-hash-types/
public enum HashType {
    case publicKey(String)
    case accountHash(String)
    case contractHash(String)
    case contractPackageHash(String)
    case uref(String)
    case hash(String)
    case transfer(String)
    case deployInfo(String)
    case eraInfo(String)
    case balance(String)
    case bid(String)
    case withdraw(String)
    case dictionary(String)
    
    var value: String {
        switch self {
        case .accountHash(let hash):
            return "account-hash-\(hash)"
        case .publicKey(let hash):
            return hash
        case .contractHash(let hash):
            return "contract-\(hash)"
        case .contractPackageHash(let hash):
            return "contract-package-wasm\(hash)"
        case .hash(let hash):
            return "hash-\(hash)"
        case .uref(let hash):
            return "uref-\(hash)"
        case .transfer(let hash):
            return "transfer-\(hash)"
        case .deployInfo(let hash):
            return "deploy-\(hash)"
        case .eraInfo(let hash):
            return "era-\(hash)"
        case .bid(let hash):
            return "bid-\(hash)"
        case .withdraw(let hash):
            return "withdraw-\(hash)"
        case .dictionary(let hash):
            return "dictionary-\(hash)"
        case .balance(let hash):
            return "balance-\(hash)"
        }
    }
}
