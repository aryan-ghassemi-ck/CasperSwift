//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

import Foundation

extension FixedWidthInteger {

    func fixedWithIntegerSerialize() throws -> Data {
        var bytes = byteArray
        let lengthOfMax = Self.max.byteArray.count
        
        // Will pad with leading 0x00 for positive and -0xFF for negative numbers if length less than maxBytes
        if bytes.count <= lengthOfMax {
            print("Not implemented")
            //bytes = zeroPad(bytes, (signed && bigInt.signum() == -1));
        } else if (bytes.count == lengthOfMax + 1 && bytes[0] == 0) {
            // If leading zero trim if maxBytes + 1 bytes long
            bytes = Data(bytes).removingLeadingZeros().bytes
        } else {
            throw CLTypeSerializationError(
                failedValue: self,
                reason: "exceeds \(lengthOfMax) length")
        }

        // Switch from BE to LE byte order
        return Data(bytes.reversed())
    }
}

extension UInt8: CLTypeDataRepresentable {
    func serialize() throws -> Data {
        try fixedWithIntegerSerialize()
    }
}

extension Int8: CLTypeDataRepresentable {
    func serialize() throws -> Data {
        try fixedWithIntegerSerialize()
    }
}

extension UInt16: CLTypeDataRepresentable {
    func serialize() throws -> Data {
        try fixedWithIntegerSerialize()
    }
}

extension Int16: CLTypeDataRepresentable {
    func serialize() throws -> Data {
        try fixedWithIntegerSerialize()
    }
}

extension UInt32: CLTypeDataRepresentable {
    func serialize() throws -> Data {
        try fixedWithIntegerSerialize()
    }
}

extension Int32: CLTypeDataRepresentable {
    func serialize() throws -> Data {
        try fixedWithIntegerSerialize()
    }
}

extension UInt64: CLTypeDataRepresentable {
    func serialize() throws -> Data {
        try fixedWithIntegerSerialize()
    }
}

extension Int64: CLTypeDataRepresentable {
    func serialize() throws -> Data {
        try fixedWithIntegerSerialize()
    }
}
