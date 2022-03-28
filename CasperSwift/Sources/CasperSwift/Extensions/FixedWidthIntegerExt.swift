//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

import Foundation

extension FixedWidthInteger {
    var byteArray: [UInt8] {
        withUnsafeBytes(of: bigEndian, Array.init)
    }
}
