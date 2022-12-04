//
//  CryptoMock.swift
//  WebSocket
//
//  Created by Murilo de Souza Lopes on 03/12/22.
//

import Foundation

class CrytoMock {
    static func getCrypto() -> [Crypto] {
        let cryptos = [
            Crypto(image: "https://s2.coinmarketcap.com/static/img/coins/64x64/1.png", title: "BTC", subTitle: "Bitcoin", variation: "+1%", price: "R$ 89.100,1193"),
            Crypto(image: "https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png", title: "ETH", subTitle: "Ethereum", variation: "-2%", price: "R$ 6.605,6182"),
            Crypto(image: "https://s2.coinmarketcap.com/static/img/coins/64x64/1.png", title: "ADA", subTitle: "Cardano", variation: "+1%", price: "R$ 1,6908"),
            Crypto(image: "https://s2.coinmarketcap.com/static/img/coins/64x64/1.png", title: "USDT", subTitle: "Tether", variation: "+1%", price: "R$ 5,2910"),
        ]
        
        return cryptos
    }
    
}
