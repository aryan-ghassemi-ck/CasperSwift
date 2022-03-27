//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

import Foundation

/// https://casper-docusaurus.scaliolabs.com/docs/design/serialization-standard/
indirect enum CLType {
    case Bool
    case I32
    case I64
    case U8
    case U32
    case U64
    case U128
    case U256
    case U512
    case Unit
    case String
    case PublicKey
    case URef
    case Key
    case Option(CLType)
    case List(CLType)
    case BytesArray(UInt32)
    case Result(CLType, CLType)
    case Map(CLType, CLType)
    case Tuple1(CLType)
    case Tuple2(CLType, CLType)
    case Tuple3(CLType, CLType, CLType)
    case CLAny
}

extension CLType {
    var isNumeric: Bool {
        switch self {
        case .I32, .I64, .U8, .U32, .U64, .U128, .U256, .U512: return true
        default: return false
        }
    }
}

extension CLType {
    var serializationTag: Int {
        switch self {
        case .Bool: return 0
        case .I32: return 1
        case .I64: return 2
        case .U8: return 3
        case .U32: return 4
        case .U64: return 5
        case .U128: return 6
        case .U256: return 7
        case .U512: return 8
        case .Unit: return 9
        case .String: return 10
        case .Key: return 11
        case .URef: return 12
        case .Option: return 13
        case .List: return 14
        case .BytesArray: return 15
        case .Result: return 16
        case .Map: return 17
        case .Tuple1: return 18
        case .Tuple2: return 19
        case .Tuple3: return 20
        case .CLAny: return 21
        case .PublicKey: return 22
        }
    }
}
