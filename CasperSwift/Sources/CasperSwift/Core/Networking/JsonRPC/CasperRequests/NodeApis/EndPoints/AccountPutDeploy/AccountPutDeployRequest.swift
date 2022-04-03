//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/26/22.
//

import Foundation

public class AccountPutDeployRequest: JsonRpcNetworkRequest<AccountPutDeployResult> {
    public convenience init(param: AccountPutDeployParam, environment: CasperEnvironment = .mainnet) {
        self.init(url: environment.url, method: .accountPutDeploy, param: param)
    }
}

public typealias DeployHash = String

public struct AccountPutDeployResult: Decodable {
    public let apiVersion: String
    public let deployHash: DeployHash
}

public struct AccountPutDeployParam: Encodable {
    public let deploy: Deploy
}

public struct Deploy: Encodable {
    let approvals: [Approval]
    let hash: String
    let header: Header
    let payment: AnyEncodable
    let session: AnyEncodable
    
    public init(
        header: Header,
        approvals: [Approval],
        hash: String,
        payment: ExecutableDeploymentItem,
        session: ExecutableDeploymentItem) throws {
            
        self.header = header
        self.approvals = approvals
        self.hash = hash
        self.payment = try payment.asAnyEncodable()
        self.session = try session.asAnyEncodable()
    }
}

extension Deploy {
    public struct Approval: Encodable {
        public let signature: String
        public let signer: String
    }
}

extension Deploy {
    public struct Header: Encodable {
        public let account: String
        public let bodyHash: String
        public let chainName: String
        public let dependencies: [String]
        public let gasPrice: Int
        public let timestamp: String
        public let ttl: String
    }
}
