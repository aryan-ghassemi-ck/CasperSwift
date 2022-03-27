//
//  DeployRequest.swift
//  CasperDemo
//
//  Created by Aryan Ghassemi on 3/20/22.
//

import Foundation

public class InfoGetPeersRequest: JsonRpcNetworkRequest<InfoGetPeersResult> {
    public convenience init() {
        self.init(url: CasperEndpoint.node, method: "info_get_peers", param: NoParam())
    }
}

public struct InfoGetPeersResult: Decodable {
    public let peers: [Peer]
}
