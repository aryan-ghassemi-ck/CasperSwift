//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/25/22.
//

import Foundation

public class InfoGetDeployRequest: JsonRpcNetworkRequest<InfoGetDeployResult> {
    public convenience init(param: InfoGetDeployParameters, environment: CasperEnvironment = .mainnet) {
        self.init(url: environment.url, method: .infoGetDeploy, param: param)
    }
}

public struct InfoGetDeployParameters: Codable {
    public let deployHash: String
    
    public init(deployHash: String) {
        self.deployHash = deployHash
    }
}

public struct InfoGetDeployResult: Decodable {
    public let apiVersion: String
    //public let deploy: Deploy
    public let executionResult: ExecutionResult
}

public struct Payment: Decodable {
    public let StoredContractByName: StoredContractByName?
}

public struct StoredContractByName: Decodable {
    public let args: String
    public let entryPoint: String
    public let name: String
}

public struct Session: Decodable {
    public let Transfer: Transfer
}

public struct Transfer: Decodable {
    public let args: String
}

public struct ExecutionResult: Decodable {
    public let blockHash: String
    public let result: ExecutionResult.Result
}

extension ExecutionResult {
    public struct Result: Decodable {
        public let Success: Success
    }
    
    public struct Success: Decodable {
        public let const: String
        public let effect: Effect
        public let transfers: [String]
        
        public struct Effect: Decodable {
            public let operations: [Operation]
            public let transforms: [Transform]
            
            public struct Operation: Decodable {
                public let key: String
                public let kind: String
            }
            
            public struct Transform: Decodable {
                public let key: String
                public let transform: String
            }
        }
    }
}
