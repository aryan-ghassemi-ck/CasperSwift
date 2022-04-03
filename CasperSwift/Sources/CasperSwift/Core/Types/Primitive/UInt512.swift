//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 4/2/22.
//

import Foundation

public class UInt512: BigInt {
    public init(_ string: String) throws {
        try super.init(string: string, sizeInBits: 512, signed: false)
    }
}
