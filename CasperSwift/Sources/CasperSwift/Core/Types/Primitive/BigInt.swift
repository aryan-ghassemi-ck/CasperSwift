//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 4/2/22.
//

import Foundation

class BigInt {

    private let backingData: _BigInt<UInt>
    private let sizeInBits: Int

    init(string: String, sizeInBits: Int, signed: Bool) throws {
        guard let value = _BigInt<UInt>(string) else {
            throw BigIntError.failedToInitialize(string)
        }
        
        if !signed && value.isNegative {
            throw BigIntError.negativeValuePassedForUnsigned(string)
        }

        self.backingData = value
        self.sizeInBits = sizeInBits
    }
    
    var byteArray: [UInt8] {
        backingData.words.reduce([UInt8]()) { $0 + $1.byteArray }
    }
    
    var maxBytes: Int {
        sizeInBits / 8
    }
}

extension BigInt: CLTypeDataRepresentable {
    
    func serialize() throws -> Data {
        var bytes = byteArray

        if bytes.count > maxBytes {
            throw CLTypeSerializationError(
                failedValue: self,
                reason: "exceeds \(maxBytes) length")
        }

        // Remove any leading zeros
        if bytes.count > 1 && bytes[0] == 0 {
            bytes = Data(bytes).removingLeadingZeros().bytes
        }

        // Switch from BE to LE byte order
        bytes = bytes.reversed()

        //Build and return the hex of the length byte
        //plus the reversed byte array of the number
        return Data(bytes.count.byteArray + bytes)
            .removingLeadingZeros() // TODO: Why did i have to do this? Java sdk doesn't have it
    }
}

enum BigIntError: Error {
    case failedToInitialize(String)
    case negativeValuePassedForUnsigned(String)
}
