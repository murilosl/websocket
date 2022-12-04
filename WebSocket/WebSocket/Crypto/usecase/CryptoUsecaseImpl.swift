//
//  CryptoUsecaseImpl.swift
//  WebSocket
//
//  Created by Murilo de Souza Lopes on 03/12/22.
//

import Foundation

class CryptoUsecaseImpl : CryptoUsecase{
    
    var repository: CryptoRepository!

    func CryptoUsecaseImpl(repository: CryptoRepository) {
        self.repository = repository
    }
    
    func listAll() -> [Crypto] {
        let cryptoList = repository.listAll()
        return cryptoList
    }
    
    
}
