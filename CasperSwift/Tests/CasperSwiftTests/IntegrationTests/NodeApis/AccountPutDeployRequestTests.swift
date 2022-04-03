//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 4/2/22.
//

import Foundation

@testable import CasperSwift
import XCTest

class AccountPutDeployRequestTests: XCTestCase {
    
    let casperClient = CasperNodeClient(session: URLSession.shared, environment: .testnet)
    
//    func testDeployTransfer() async throws {
//        let deploy = AccountPutDeployParam.Deploy(approvals: <#T##[Approval]#>)
//        
//        casperClient.putDeploy(deploy: AccountPutDeployParam.Deploy)
//    }
}
