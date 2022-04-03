//
//  DeployRequest.swift
//  CasperDemo
//
//  Created by Aryan Ghassemi on 3/20/22.
//

import Foundation

public class InfoGetPeersRequest: JsonRpcNetworkRequest<InfoGetPeersResult> {
    public convenience init(environment: CasperEnvironment = .mainnet) {
        self.init(url: environment.url, method: .infoGetPeers, param: NoParam())
    }
}

public struct InfoGetPeersResult: Decodable {
    public let peers: [Peer]
}
