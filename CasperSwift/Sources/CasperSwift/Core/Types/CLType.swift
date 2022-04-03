//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

import Foundation

/// https://casper-docusaurus.scaliolabs.com/docs/design/serialization-standard/
public indirect enum CLType: CLTypeDataRepresentable {
    case Bool(Bool)
    case I32(Int32)
    case I64(Int64)
    case U8(UInt8)
    case U32(UInt32)
    case U64(UInt64)
    case U128(UInt128)
    case U256(UInt256)
    case U512(UInt512)
    case Unit
    case String(String)
    case PublicKey(String)
    case URef(URef)
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
        switch self {
        case .Bool: return "Bool"
        case .I32: return "I32"
        case .I64: return "I64"
        case .U8: return "U8"
        case .U32: return "U32"
        case .U64: return "U64"
        case .U128: return "U128"
        case .U256: return "U256"
        case .U512: return "U512"
        case .Unit: return "Unit"
        case .String: return "String"
        case .PublicKey: return "PublicKey"
        case .URef: return "URef"
        case .Key: return "Key"
        case .Option: return "Option"
        case .List: return "List"
        case .BytesArray: return "BytesArray"
        case .Result: return "Result"
        case .Map: return "Map"
        case .Tuple1: return "Tuple1"
        case .Tuple2: return "Tuple2"
        case .Tuple3: return "Tuple3"
        case .CLAny: return "CLAny"
        }
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
        case .U128(let uint128):
            return try uint128.serialize()
        case .U256(let uint256):
            return try uint256.serialize()
        case .U512(let uint512):
            return try uint512.serialize()
        case .BytesArray(let data):
            return try data.serialize()
        case .URef(let uref):
            return try uref.serialize()
        case .PublicKey:
            return Data() // TODO: Implement
        default:
            // TODO: Implement the rest
            fatalError()
        }
    }
}

extension CLType {
    var serializationTag: UInt8 {
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
