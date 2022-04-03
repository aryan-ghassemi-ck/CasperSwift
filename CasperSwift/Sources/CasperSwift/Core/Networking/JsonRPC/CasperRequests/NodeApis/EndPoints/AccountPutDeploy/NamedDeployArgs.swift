//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 4/3/22.
//

import Foundation

/*
 https://casper-docusaurus.scaliolabs.com/docs/design/serialization-standard/
 
 EX Payment: The key "payment" does not represent this object; payment is the parent
 
 "payment":{
    "ModuleBytes":{
        "args":[
            [
                "amount",
                {
                    "bytes":"0400e1f505"
                    "parsed":"100000000"
                    "cl_type":"U512"
                }
            ]
        ]
    "module_bytes":""
 }
 
 EX Session:  The key "session" does not represent this object; payment is the parent
 
 "session":{
    "Transfer":{
        "args":[
            [
                "amount",
                {
                    "bytes":"06001243b27a2d"
                    "parsed":"50005000000000"
                    "cl_type":"U512"
                }
            ],
            [
                "target",
                {
                    "bytes":"0203eda7afb30985ffa19de522f0841708911f42ad03a19e2b0da14b10fb33074543"
                    "parsed":"0203eda7afb30985ffa19de522f0841708911f42ad03a19e2b0da14b10fb33074543"
                    "cl_type":"PublicKey"
                }
            ],
            [
                "id",
                {
                    "bytes":"010f7051f07f010000"
                    "parsed":1649004343311
                    "cl_type":{
                        "Option":"U64"
                    }
                }
            ]
        ]
    }
 }
 
 */

public class NamedDeployArgs {
    /// ex: ModuleBytes, StoredContractByHash, Transfer
    let type: SessionType
    let arguments: [Argument]
    
    internal init(type: SessionType, arguments: [Argument]) {
        self.type = type
        self.arguments = arguments
    }

    func asAnyEncodable() throws -> AnyEncodable {
        [
            type.name: [
                "args": [
                    try arguments.map { try $0.asAnyEncodable() }
                ],
            ].merging(type.contractInfo) { $1 }
        ]
    }
}
extension NamedDeployArgs {
    public struct Argument {
        public let name: String
        public let clValue: CLValue
        
        func asAnyEncodable() throws -> AnyEncodable {
            [
                name,
                [
                    "bytes": clValue.bytes,
                    "cl_type": clValue.clType,
                ]
            ]
        }
    }
}

extension NamedDeployArgs {
    public enum SessionType {
        case moduleBytes
        case transfer
        case storedContractByHash(hash: String, entryPoint: String)
        case storedContractByName(name: String, entryPoint: String)
        case storedVersionedContractByHash(hash: String, version: String, entryPoint: String)
        case storedVersionedContractByName(name: String, version: String, entryPoint: String)
        
        var name: String {
            switch self {
            case .moduleBytes: return "ModuleBytes"
            case .transfer: return "Transfer"
            case .storedContractByHash: return "StoredContractByHash"
            case .storedContractByName: return "StoredContractByName"
            case .storedVersionedContractByHash: return "StoredVersionedContractByHash"
            case .storedVersionedContractByName: return "StoredVersionedContractByName"
            }
        }
        
        var contractInfo: [String: String] {
            switch self {
            case .moduleBytes:
                return [:]
                
            case .transfer:
                return [:]
                
            case let .storedContractByHash(hash, entryPoint):
                return [
                    "hash": hash,
                    "entryPoint": entryPoint
                ]
                
            case let .storedContractByName(name, entryPoint):
                return [
                    "name": name,
                    "entryPoint": entryPoint
                ]
                
            case let .storedVersionedContractByHash(hash, version, entryPoint):
                return [
                    "hash": hash,
                    "version": version,
                    "entryPoint": entryPoint
                ]
                
            case let .storedVersionedContractByName(name, version, entryPoint):
                return [
                    "name": name,
                    "version": version,
                    "entryPoint": entryPoint
                ]
            }
        }
    }
}
