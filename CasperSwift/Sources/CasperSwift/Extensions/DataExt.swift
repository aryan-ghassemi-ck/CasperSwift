//
//  DataExt.swift
//  CasperDemo
//
//  Created by Aryan Ghassemi on 3/20/22.
//

import Foundation

extension Data {

    init?(base64EncodedURLSafe string: String, options: Base64DecodingOptions = []) {
        let string = string
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")

        self.init(base64Encoded: string, options: options)
    }
    
    public var bytes: Array<UInt8> {
      Array(self)
    }
    
    /// A hexadecimal string representation of the bytes.
    var hexEncodedString: String {
      let hexDigits = Array("0123456789abcdef".utf16)
      var hexChars = [UTF16.CodeUnit]()
      hexChars.reserveCapacity(count * 2)

      for byte in self {
        let (index1, index2) = Int(byte).quotientAndRemainder(dividingBy: 16)
        hexChars.append(hexDigits[index1])
        hexChars.append(hexDigits[index2])
      }

      return String(utf16CodeUnits: hexChars, count: hexChars.count)
    }
}

extension Data {
    func removingLeadingZeros() -> Data {
        var array = bytes
        
        for byte in array {
            if byte == 0 {
                array.removeFirst()
            } else {
                break
            }
        }
        
        return Data(array)
    }
}

extension Data {
    struct HexEncodingOptions: OptionSet {
        let rawValue: Int
        static let upperCase = HexEncodingOptions(rawValue: 1 << 0)
    }

    func hexEncodedString(options: HexEncodingOptions = []) -> String {
        let format = options.contains(.upperCase) ? "%02hhX" : "%02hhx"
        return self.map { String(format: format, $0) }.joined()
    }
}
