//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

import Foundation

public struct CLValue {
    //public let data: Data
    public let bytes: String
    public let clType: String
    public let parsed: Any
    
    public init(clType: CLType) throws {
        self.clType = clType.name
        self.bytes = try clType.serialize().hexEncodedString
        self.parsed = clType
        
        //let clBytes = try clType.serialize()
        //self.data = try UInt32(clBytes.count).serialize() + clBytes + Data([clType.serializationTag])
    }
}
