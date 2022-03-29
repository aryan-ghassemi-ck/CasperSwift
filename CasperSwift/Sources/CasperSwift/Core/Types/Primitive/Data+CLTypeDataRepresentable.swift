//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/28/22.
//

import Foundation

extension Data: CLTypeDataRepresentable {
    func serialize() throws -> Data {
        try UInt32(count).serialize() + self
    }
}
