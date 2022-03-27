//
//  PublicKeyType.swift
//  CasperDemo
//
//  Created by Aryan Ghassemi on 3/20/22.
//

import Foundation

struct PublicKey {
    let data: [UInt]
    let type: PublicKeyType
    
    init(data: [UInt], type: PublicKeyType) throws {
        if data.count != type.length {
            throw PublicKeyError.invalidSize
        }
        
        self.data = data
        self.type = type
    }
}

enum PublicKeyError: Error {
    case invalidSize
}

enum PublicKeyType {
    case ED25519
    case SECP256K1
    
    var length: UInt {
        switch self {
        case .ED25519: return 32
        case .SECP256K1: return 33
        }
    }
}
