//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

import Foundation

struct CLValue {
    let bytes: String
    let clType: String
    // let parsed: T
    
    init(clType: CLType) throws {
        self.clType = clType.name
        self.bytes = try clType.serialize().hexEncodedString
    }
}
