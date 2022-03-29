//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

import Foundation

/// https://casper-docusaurus.scaliolabs.com/docs/design/serialization-standard/
indirect enum CLType: CLTypeDataRepresentable {
    case Bool(Bool)
    case I32(Int32)
    case I64(Int64)
    case U8(UInt8)
    case U32(UInt32)
    case U64(UInt64)
    case U128(UInt)
    case U256(UInt)
    case U512(UInt)
    case Unit
    case String(String)
    case PublicKey(String)
    case URef(String)
    case Key(String)
    case Option(CLType?)
    case List([CLType])
    case BytesArray(Data)
    case Result(CLType, CLType)
    // case Map([CLType: CLType]) // TODO: Make CLType Hashable then uncomment thos code
    case Map((CLType, CLType))
    case Tuple1(CLType)
    case Tuple2((CLType, CLType))
    case Tuple3((CLType, CLType, CLType))
    case CLAny(Any)
    
    var name: String {
        return "TODO"
    }
    
    func serialize() throws -> Data {
        switch self {
        case .Bool(let bool):
            return try bool.serialize()
        case .String(let string):
            return try string.serialize()
        case .U32(let uint32):
            return try uint32.serialize()
        case .U64(let uint64):
            return try uint64.serialize()
        default:
            // TODO: Implement the rest
            fatalError()
        }
    }
}


//extension CLType {
//    var serializationTag: Int {
//        switch self {
//        case .Bool: return 0
//        case .I32: return 1
//        case .I64: return 2
//        case .U8: return 3
//        case .U32: return 4
//        case .U64: return 5
//        case .U128: return 6
//        case .U256: return 7
//        case .U512: return 8
//        case .Unit: return 9
//        case .String: return 10
//        case .Key: return 11
//        case .URef: return 12
//        case .Option: return 13
//        case .List: return 14
//        case .BytesArray: return 15
//        case .Result: return 16
//        case .Map: return 17
//        case .Tuple1: return 18
//        case .Tuple2: return 19
//        case .Tuple3: return 20
//        case .CLAny: return 21
//        case .PublicKey: return 22
//        }
//    }
//}
