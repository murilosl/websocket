//
//  CryptoController.swift
//  WebSocket
//
//  Created by Murilo de Souza Lopes on 03/12/22.
//

import Foundation

protocol CryptoController {
    func prepareCoins(crypto: String) -> [Coin]
    func reloadCoin(coin: String) -> [Cotation]
}
