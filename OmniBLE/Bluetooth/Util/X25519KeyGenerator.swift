//
//  X25519KeyGenerator.swift
//  OmnipodKit
//
//  Created by Randall Knutson on 8/8/21.
//
import CryptoKit
import Foundation

struct X25519KeyGenerator {
    func generatePrivateKey() -> Data {
//        let key = Curve25519.KeyAgreement.PrivateKey()
//        return key.rawRepresentation
        return Data(hex: "27ec94b71a201c5e92698d668806ae5ba00594c307cf5566e60c1fc53a6f6bb6")
    }
    func publicFromPrivate(_ privateKey: Data) throws -> Data{
        let key = try Curve25519.KeyAgreement.PrivateKey(rawRepresentation: privateKey)
        return key.publicKey.rawRepresentation
    }
    func computeSharedSecret(_ privateKey: Data, _ publicKey: Data) throws -> Data {
        let priv = try Curve25519.KeyAgreement.PrivateKey(rawRepresentation: privateKey)
        let pub = try Curve25519.KeyAgreement.PublicKey(rawRepresentation: publicKey)
        let secret = try priv.sharedSecretFromKeyAgreement(with: pub)
        return secret.withUnsafeBytes({ return Data($0)})
    }
}
