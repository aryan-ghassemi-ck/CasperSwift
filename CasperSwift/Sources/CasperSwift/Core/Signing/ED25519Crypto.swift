//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

import CryptoKit
import Foundation

struct ED25519Crypto {

    let privateKey: Curve25519.Signing.PrivateKey
    let publicKey: Curve25519.Signing.PublicKey
    
    private static let pemPrefix = "-----BEGIN PRIVATE KEY-----";
    private static let pemSuffix = "-----END PRIVATE KEY-----";
    private static let privateKeyPrefix = "MC4CAQAwBQYDK2VwBCIEI"
    private static let publicKeyPrefix = "MCowBQYDK2VwAyEA"
    
    static let prefixPrivateKeyData = Data([
        0x30, 0x2e, 0x02, 0x01, 0x00, 0x30, 0x05, 0x06, 0x03, 0x2b, 0x65, 0x70, 0x04, 0x22,0x04,0x20])
    
    init() {
        privateKey = Curve25519.Signing.PrivateKey()
        publicKey = privateKey.publicKey
    }
    
    init(privateKey: Curve25519.Signing.PrivateKey) {
        self.privateKey = privateKey
        self.publicKey = privateKey.publicKey
    }

    init(privateKeyString: String) throws {
        let keyWithoutNewLines = privateKeyString
            .trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            .replacingOccurrences(of: "\n", with: "")
        
        if !keyWithoutNewLines.hasPrefix(Self.pemPrefix) {
            throw ED25519CryptoError.invalidPrivateKeyPrefix
        }
        
        if !keyWithoutNewLines.hasSuffix(Self.pemSuffix) {
            throw ED25519CryptoError.invalidPrivateKeySuffix
        }
        
        let cleanKey = keyWithoutNewLines
            .replacingOccurrences(of: Self.pemPrefix, with: "")
            .replacingOccurrences(of: Self.pemSuffix, with: "")
        
        let pemIndex = cleanKey.index(cleanKey.startIndex, offsetBy: 21)
        let privateBase64String = String(cleanKey[pemIndex..<cleanKey.endIndex])
        let fullPemKeyBase64 = Self.privateKeyPrefix + privateBase64String
        
        guard let privateBase64DecodedData = Data(base64Encoded: fullPemKeyBase64) else {
            throw ED25519CryptoError.base64EncodingFailed
        }
        
        let base64ToBytes = privateBase64DecodedData.bytes
        let privateBytes = base64ToBytes[Self.prefixPrivateKeyData.count..<base64ToBytes.count];
        
        do {
            let privateKey = try Curve25519.Signing.PrivateKey.init(rawRepresentation: privateBytes)
            self.init(privateKey: privateKey)
        } catch {
            throw ED25519CryptoError.curve25519Failed(error)
        }
    }
    
    func sign(data: Data) throws -> Data {
        try privateKey.signature(for: data)
    }
}

public enum ED25519CryptoError: Error {
    case invalidPrivateKeyPrefix
    case invalidPrivateKeySuffix
    case base64EncodingFailed
    case curve25519Failed(Error)
}
