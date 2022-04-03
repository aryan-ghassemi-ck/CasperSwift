//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 4/2/22.
//

import Foundation

public struct CLPublicKey: Taggable, CLTypeDataRepresentable {

    public let algorithm: Algorithm
    private let bytes: [UInt8]
    public let tag: UInt8 = 1

    public init(bytes: [UInt8], algorithm: Algorithm) {
        self.bytes = bytes
        self.algorithm = algorithm
    }
    
    init(bytes: [UInt8]) throws {
        guard let algoId = bytes.first else {
            throw CLPublicKeyError.emptyBytes
        }
        
        guard let algo = Algorithm(rawValue: algoId) else {
            throw CLPublicKeyError.invalidalgorithmId(algoId)
        }
        
        self.algorithm = algo
        
        var bytesWithoutalgo = bytes
        bytesWithoutalgo.removeFirst()
        self.bytes = bytesWithoutalgo
    }
    
    init(key: String, algorithm: Algorithm) {
        self.bytes = key.hexDecodedData.bytes
        self.algorithm = algorithm
    }
    
    func serialize() throws -> Data {
        Data([algorithm.rawValue] + bytes)
    }
}

public enum Algorithm: UInt8 {
    case ED25519 = 1
    case SECP256K1 = 2
}

enum CLPublicKeyError: Error {
    case emptyBytes
    case invalidalgorithmId(UInt8)
}
