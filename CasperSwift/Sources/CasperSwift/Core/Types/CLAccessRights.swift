//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

import Foundation

public enum CLAccessRights: UInt8 {
    case none = 0
    case read = 1
    case write = 2
    case readWrite = 3
    case add = 4
    case readAdd = 5
    case addWrite = 6
    case readAddWrite = 7
    
    var bits: UInt8 {
        rawValue
    }
}
