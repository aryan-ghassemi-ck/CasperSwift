//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 4/2/22.
//

import Foundation

class UInt128: BigInt {
    init(_ string: String) throws {
        try super.init(string: string, sizeInBits: 128, signed: false)
    }
}
