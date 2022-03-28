//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

import Foundation

protocol CLTypeDataRepresentable {
    func serialize() throws -> Data
}
