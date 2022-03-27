//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/26/22.
//

import CryptoKit

struct ED25519Crypto {

    let privateKey: Curve25519.Signing.PrivateKey
    let publicKey: Curve25519.Signing.PublicKey
    
    
    init() {
        privateKey = Curve25519.Signing.PrivateKey()
        publicKey = privateKey.publicKey
    }
}
