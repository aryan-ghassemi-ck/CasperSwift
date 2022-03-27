//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/26/22.
//

import Foundation

public class JsonRpcNetworkRequest<ResultType>: CodableNetworkRequest<ResultType> where ResultType: Decodable {
 
    convenience init<T: Encodable>(url: URL, method: String, param: T?) {
        let deserializer: Deserializer = {
            let response = try JsonRpcCoder.decoder.decode(JsonRpcResponse<ResultType>.self, from: $0)
            
            if let error = response.error {
                throw error
            } else if let result = response.result {
                return result
            } else {
                throw JsonRpcError(code: 0, message: "nil result in response")
            }
        }
        
        self.init(
            url: url,
            httpMethod: .post,
            encodableBody: JsonRpcRequestBody(method: method, params: param),
            httpHeaders: [:],
            jsonDecoder: JsonRpcCoder.decoder,
            jsonEncoder: JsonRpcCoder.encoder,
            customDeserializer: deserializer)
    }
}

fileprivate struct JsonRpcResponse<Result>: Decodable where Result: Decodable {
    let jsonrpc: String
    let result: Result?
    let error: JsonRpcError?
}

public struct JsonRpcError: Error, Decodable {
    public let code: Int
    public let message: String
}

fileprivate struct JsonRpcRequestBody<T: Encodable>: Encodable {
    let id: String?
    let jsonrpc: String
    let method: String
    let params: T?
    
    init(method: String, params: T?, isNotification: Bool = false) {
        self.id = isNotification ? nil : UUID().uuidString
        self.jsonrpc = "2.0"
        self.method = method
        self.params = params
    }
}

public struct NoParam: Encodable {}
