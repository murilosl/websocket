//
//  Crypto.swift
//  WebSocket
//
//  Created by Murilo de Souza Lopes on 03/12/22.
//

import Foundation

//struct Crypto{
//    let image: String?
//    let title: String?
//    let subTitle: String?
//    let variation: String?
//    let price: String?
//}

struct Crypto: Decodable {
    let m, i: Int
    let n: String
    let o: String
//    let o: [Coin]
}

struct Coin: Decodable {
    let Product1Symbol: String
    let InstrumentId: Int
}

struct Cotation: Decodable {
    let LastTradedPx: String
    let Rolling24HrPxChange: String
}
