//
//  StringProtocolExt.swift
//  CasperDemo
//
//  Created by Aryan Ghassemi on 3/20/22.
//

import Foundation

extension StringProtocol {
    var data: Data { Data(utf8) }
    
    var base64Encoded: Data { data.base64EncodedData() }
}
