//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 4/2/22.
//

@testable import CasperSwift
import XCTest

class DeployTests: XCTestCase {
    
    func testTransfer() throws {
        
        let header = Deploy.Header(
            account: "",
            bodyHash: "",
            chainName: "",
            dependencies: [],
            gasPrice: 1,
            timestamp: "",
            ttl: "")
        
        let approval = Deploy.Approval(signature: "", signer: "")
        
        let deploy = try Deploy(
            header: header,
            approvals: [approval],
            hash: "",
            paymentArgs: PaymentDeployArgs(amount: 100000000),
            sessionArgs: TransferDeployArgs(amount: 12300000000000, to: "Some Account"))
        
        let data = try JSONEncoder().encode(deploy)
        let json: [String: Any]? = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        print(json)
        // TODO: Validate json
    }
}
