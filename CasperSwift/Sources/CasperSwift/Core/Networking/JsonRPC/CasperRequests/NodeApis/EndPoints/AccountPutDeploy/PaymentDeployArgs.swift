//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 4/3/22.
//

import Foundation

public class PaymentDeployArgs: NamedDeployArgs {
    public init(amount: Int) throws {
        super.init(
            type: .moduleBytes,
            arguments: [ NamedDeployArgs.Argument(name: "amount", clValue: try CLValue(clType: .U512(UInt512("\(amount)")))) ]
        )
    }
}
