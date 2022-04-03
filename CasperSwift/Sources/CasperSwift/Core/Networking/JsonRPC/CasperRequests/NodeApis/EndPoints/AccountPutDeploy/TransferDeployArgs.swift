//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 4/3/22.
//

import Foundation

public class TransferDeployArgs: NamedDeployArgs {
    public init(amount: Int, to: String) throws {
        super.init(type: .transfer, arguments: [
            try NamedDeployArgs.Argument(name: "id", clValue: CLValue(clType: .U64(123123))),
            try NamedDeployArgs.Argument(name: "amount", clValue: CLValue(clType: .U512(UInt512("\(amount)")))),
            try NamedDeployArgs.Argument(name: "target", clValue: CLValue(clType: .PublicKey(to)))
        ])
    }
}
