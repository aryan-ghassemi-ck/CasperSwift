//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

import Foundation

extension String: CLTypeDataRepresentable {
    func serialize() throws -> Data {
        guard let bytes = data(using: .utf8) else {
            throw CLTypeSerializationError(
                failedValue: self,
                reason: "Conversion from string to Data Failed")
        }
        
        let byteCount: UInt32 = UInt32(bytes.count)
        let sizeCountBytes = try byteCount.serialize()
        return sizeCountBytes + bytes
    }
}
