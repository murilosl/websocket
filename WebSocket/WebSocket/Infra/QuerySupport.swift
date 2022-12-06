//
//  QuerySupport.swift
//  WebSocket
//
//  Created by Murilo de Souza Lopes on 05/12/22.
//

import Foundation

class QuerySupport {
    static func instrument(id: Int) -> String {
        let instrumentId = String("{\"m\":0,\"i\":0,\"n\":\"SubscribeLevel1\",\"o\":\"{\"InstrumentId\":\(id)}\"}")
        return instrumentId
    }
}
