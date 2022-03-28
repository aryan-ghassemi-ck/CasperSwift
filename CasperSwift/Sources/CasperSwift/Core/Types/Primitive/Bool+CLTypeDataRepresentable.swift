//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

import Foundation

extension Bool: CLTypeDataRepresentable {
    func serialize() throws -> Data {
        self == true ? Data([1]) :  Data([0])
    }
}
