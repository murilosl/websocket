//
//  CryptoUsecaseImpl.swift
//  WebSocket
//
//  Created by Murilo de Souza Lopes on 03/12/22.
//

import Foundation

class CryptoUsecaseImpl : CryptoUsecase{
    
    let repository = CryptoRepositoryImpl()

    func reloadCoin(coin: String) -> [Cotation] {
        let cotation = repository.reloadCoin(coin: coin)
        return cotation
    }
    
    func prepareCoins(crypto: String) -> [Coin] {
        let cryptoList = repository.prepareCoins(crypto: crypto)
        return cryptoList
    }
}
