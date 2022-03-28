//
//  File.swift
//  
//
//  Created by Aryan Ghassemi on 3/27/22.
//

import Foundation

@testable import CasperSwift
import XCTest

class ED25519CryptoTests: XCTestCase {

    func testPrivateKeyInvalidPrefix() {
        do {
            let privateKey = "MC4CAQAwBQYDK2VwBCIEIJoVw4ycLyOE3rvk+6rpJvumnln6kKZaW88CkO1lr8bJ\n-----END PRIVATE KEY-----\n"
            
            _ = try ED25519Crypto(privateKeyString: privateKey)
            XCTFail("Should have thrown error")
        }  catch ED25519CryptoError.invalidPrivateKeyPrefix {
            // Success
        } catch {
            XCTFail("Should have caught invalidPrivateKeyPrefix")
        }
    }
    
    func testPrivateKeyInvalidSuffix() {
        do {
            let privateKey = "-----BEGIN PRIVATE KEY-----\nMC4CAQAwBQYDK2VwBCIEIJoVw4ycLyOE3rvk+6rpJvumnln6kKZaW88CkO1lr8bJ"
            
            _ = try ED25519Crypto(privateKeyString: privateKey)
            XCTFail("Should have thrown error")
        }  catch ED25519CryptoError.invalidPrivateKeySuffix {
            // Success
        } catch {
            XCTFail("Should have caught invalidPrivateKeyPrefix")
        }
    }
    
    func testInvalidBase64InKey() {
        do {
            let privateKey = "-----BEGIN PRIVATE KEY-----\nMC4CAQAwBQYDK2Vwrvk+6rpJvumnln6kKZaW88CkO1lr8bJ\n-----END PRIVATE KEY-----\n"
            
            _ = try ED25519Crypto(privateKeyString: privateKey)
            XCTFail("Should have thrown error")
        }  catch ED25519CryptoError.base64EncodingFailed {
            // Success
        } catch {
            XCTFail("Should have caught base64EncodingFailed")
        }
    }
    
    func testValidPublicKey() throws {
        let privateKey = "-----BEGIN PRIVATE KEY-----\nMC4CAQAwBQYDK2VwBCIEIJoVw4ycLyOE3rvk+6rpJvumnln6kKZaW88CkO1lr8bJ\n-----END PRIVATE KEY-----\n"

        _ = try ED25519Crypto(privateKeyString: privateKey)
    }
}
