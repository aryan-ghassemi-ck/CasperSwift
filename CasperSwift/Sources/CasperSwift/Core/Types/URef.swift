//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 4/2/22.
//

import Foundation

public struct URef {

    public let bytes: [UInt8]
    public let accessRights: CLAccessRights
    
    public init(bytes: [UInt8], accessRights: CLAccessRights) {
        self.bytes = bytes
        self.accessRights = accessRights
    }
    
    public init(hexString: String, accessRights: CLAccessRights) {
        self.bytes = hexString.hexDecodedData.bytes
        self.accessRights = accessRights
    }
    
    public init(urefString: String) throws {
        self.bytes = try Self.bytes(from: urefString)
        
        guard
            let lastChar = urefString.last,
            let lastCharNumericValue = lastChar.wholeNumberValue else {
            throw UrefError.invalidUref(urefString)
        }
        
        let lastCharInt8Value = UInt8(lastCharNumericValue)
        
        guard let rights = CLAccessRights(rawValue: lastCharInt8Value) else {
            throw UrefError.invalidAccessRightValue(lastCharInt8Value)
        }
        
        self.accessRights = rights
    }
    
    private static func bytes(from urefString: String) throws -> [UInt8] {
        // final String[] split = uRef.split(Pattern.quote("-"));
        let split = urefString.split(separator: "-")
        
        if split.first != "uref" {
            throw UrefError.invalidUref(urefString)
        }
        
        if split.count < 2 {
            throw UrefError.invalidUref(urefString)
        }

        return String(split[1]).hexDecodedData.bytes
    }
}

public enum UrefError: Error {
    case invalidUref(String)
    case invalidAccessRightValue(UInt8)
}

extension URef: Taggable {
    var tag: UInt8 { 2 }
}

extension URef: CLTypeDataRepresentable {
    func serialize() throws -> Data {
        /*
         return new ByteArrayBuilder()
                 .append((byte) ((URef) toSerialize).getTag())
                 .append(((URef) toSerialize).getBytes())
                 .append(((URef) toSerialize).getAccessRights().getBits())
                 .toByteArray();
         */
        let bytes: [UInt8] = [tag] + bytes + [accessRights.rawValue]
        return Data(bytes)
    }
}
