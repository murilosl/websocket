//
//  CryptoRepositoryImpl.swift
//  WebSocket
//
//  Created by Murilo de Souza Lopes on 03/12/22.
//

import Foundation

class CryptoRepositoryImpl : CryptoRepository{

    
    static var coins: [Coin] = []
    
    init() {
        
    }
    func prepareCoins(crypto: String) -> [Coin] {
        let jsonData = Data(crypto.utf8)
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(Crypto.self, from: jsonData)
            let o = Data(result.o.utf8)
            let coins = try decoder.decode([Coin].self, from: o)
            CryptoRepositoryImpl.coins = coins
            return coins
        } catch let error {
            print("\(error.localizedDescription)")
            return []
        }
    }
    
    func reloadCoin(coin: String) -> [Cotation] {
        let jsonData = Data(coin.utf8)
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(Crypto.self, from: jsonData)
            let o = Data(result.o.utf8)
            let cotation = try decoder.decode([Cotation].self, from: o)
            return cotation
        } catch let error {
            print("\(error.localizedDescription)")
            return []
        }
    }
}
