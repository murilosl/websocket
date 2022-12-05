//
//  CryptoUsecaseImpl.swift
//  WebSocket
//
//  Created by Murilo de Souza Lopes on 03/12/22.
//

import Foundation

class CryptoUsecaseImpl : CryptoUsecase{
    
    func prepareCoins(crypto: String) -> [Coin] {
        let repository = CryptoRepositoryImpl()
        let cryptoList = repository.prepareCoins(crypto: crypto)
        return cryptoList
    }
}
