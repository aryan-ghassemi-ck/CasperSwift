//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 4/3/22.
//

import Foundation

extension ExecutableDeploymentItem {

    public static func createPaymentItem(amount: Int) throws -> ExecutableDeploymentItem {
        ExecutableDeploymentItem(
            type: .moduleBytes,
            args: [ ExecutableDeploymentItem.Argument(name: "amount", clValue: try CLValue(clType: .U512(UInt512("\(amount)")))) ]
        )
    }
    
    public static func createTransferItem(amount: Int, to: String) throws -> ExecutableDeploymentItem {
        ExecutableDeploymentItem(
            type: .transfer,
            args: [
                try ExecutableDeploymentItem.Argument(name: "id", clValue: CLValue(clType: .U64(123123))),
                try ExecutableDeploymentItem.Argument(name: "amount", clValue: CLValue(clType: .U512(UInt512("\(amount)")))),
                try ExecutableDeploymentItem.Argument(name: "target", clValue: CLValue(clType: .PublicKey(to)))
        ])
    }
}
