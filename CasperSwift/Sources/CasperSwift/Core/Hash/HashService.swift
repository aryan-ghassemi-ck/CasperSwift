//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

import Blake2
import Foundation

struct HashService {

    func getAccountHash(accountKey: String) throws -> String {
        "WTF"
//        try getAccountHash(data: Data(fromHexEncodedString: accountKey)!)
    }

    func getAccountHash(data: Data) throws -> String {
        guard let string = String(data: try Blake2.hash(.b2b, size: 32, data: data), encoding: .utf8) else {
            throw HashServiceError.failed
        }
        
        return string
    }
}

enum HashServiceError: Error {
    case failed
}
