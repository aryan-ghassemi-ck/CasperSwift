//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/26/22.
//

import Foundation

/// https://casper-docusaurus.scaliolabs.com/docs/workflow/transfer-workflow/
public class AccountPutDeployRequest: JsonRpcNetworkRequest<AccountPutDeployResult> {
    public convenience init(param: AccountPutDeployParam, environment: CasperEnvironment = .mainnet) {
        self.init(url: environment.url, method: .accountPutDeploy, param: param)
    }
}

public typealias DeployHash = String

public struct AccountPutDeployResult: Decodable {
    public let apiVersion: String
    public let deployHash: String
}

public struct AccountPutDeployParam: Encodable {
    public let deploy: Deploy
}

extension AccountPutDeployParam {
    public struct Deploy: Encodable {
        public let approvals: [Approval]
    }
    
    public struct Session: Encodable {
        
    }
}
