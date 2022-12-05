//
//  CryptoControllerImpl.swift
//  WebSocket
//
//  Created by Murilo de Souza Lopes on 03/12/22.
//

import Foundation

class CryptoControllerImpl : CryptoController{
    func prepareCoins(crypto: String) -> [Coin] {
        let useCase = CryptoUsecaseImpl()
        return useCase.prepareCoins(crypto: crypto)
    }
}
