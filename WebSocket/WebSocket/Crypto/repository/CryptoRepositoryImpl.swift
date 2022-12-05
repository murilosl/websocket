//
//  CryptoRepositoryImpl.swift
//  WebSocket
//
//  Created by Murilo de Souza Lopes on 03/12/22.
//

import Foundation

class CryptoRepositoryImpl : CryptoRepository{
    func prepareCoins(crypto: String) -> [Coin] {
        let jsonData = Data(crypto.utf8)
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(Crypto.self, from: jsonData)
            let o = Data(result.o.utf8)
            let coins = try decoder.decode([Coin].self, from: o)
            return coins
        } catch let error {
            print("\(error.localizedDescription)")
            return []
        }
    }
}
