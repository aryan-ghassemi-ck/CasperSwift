//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/28/22.
//

import Foundation

extension UInt8: CLTypeDataRepresentable {
    func serialize() throws -> Data {
        Data(byteArray)
    }
}
