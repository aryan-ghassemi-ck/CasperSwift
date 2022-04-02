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
        
        if bytes.count <= Self.byteWidth {
            // Will pad with leading 0x00 for positive and -0xFF for negative numbers if length less than maxBytes
            bytes = zeroPad()
        } else if bytes.count == Self.byteWidth + 1 && bytes[0] == 0 {
            // If leading zero trim if maxBytes + 1 bytes long
            bytes = Data(bytes).removingLeadingZeros().bytes
        } else {
            throw CLTypeSerializationError(
                failedValue: self,
                reason: "exceeds \(Self.byteWidth) length")
        }

        // Switch from BE to LE byte order
        return Data(bytes.reversed())
    }
    
    static var byteWidth: Int {
        bitWidth / 8
    }
    
    private func zeroPad() -> [UInt8] {
        if byteArray.count < Self.byteWidth {
            let numberOfZeros = Self.byteWidth - byteArray.count
            let byteToPadWith: UInt8 = self < 0 ? 0xFF : 0
            return byteArray + Array<UInt8>(repeating: byteToPadWith, count: numberOfZeros)
        } else {
            return byteArray
        }
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
