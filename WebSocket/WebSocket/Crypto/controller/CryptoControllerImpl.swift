//
//  CryptoControllerImpl.swift
//  WebSocket
//
//  Created by Murilo de Souza Lopes on 03/12/22.
//

import Foundation

class CryptoControllerImpl : CryptoController{
    
    let useCase = CryptoUsecaseImpl()
    
    func reloadCoin(coin: String) -> [Cotation] {
        return useCase.reloadCoin(coin: coin)
    }
    
    func prepareCoins(crypto: String) -> [Coin] {
        return useCase.prepareCoins(crypto: crypto)
    }
}
