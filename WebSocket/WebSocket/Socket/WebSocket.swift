    //
    //  WebSocket.swift
    //  WebSocket
    //
    //  Created by Murilo de Souza Lopes on 04/12/22.
    //

import Foundation

class WebSocket{
    
    private var webSocket: URLSessionWebSocketTask?
    static let url = "ws://api.foxbit.com.br?origin=android"
    static let getInstrumentId = "{\"m\":0,\"i\":0,\"n\":\"getInstruments\",\"o\":\"{}\"}"
    
    init(url: String, delegate: URLSessionDelegate) {
        let session = URLSession(configuration: .default, delegate: delegate, delegateQueue: OperationQueue())
        let url = URL(string: url)
        webSocket = session.webSocketTask(with: url!)
        webSocket?.resume()
    }
    
    @objc func closeSession(){
        webSocket?.cancel(with: .goingAway, reason: "Closed connection".data(using: .utf8))
    }
    
    func receive(){
        
        let workItem = DispatchWorkItem{ [weak self] in
            
            self?.webSocket?.receive(completionHandler: { result in
                
                switch result {
                case .success(let message):
                    
                    switch message {
                    
                    case .data(let data):
                        print("Data received \(data)")
                        
                    case .string(let strMessgae):
                    print("String received \(strMessgae)")
                        
                    default:
                        break
                    }
                
                case .failure(let error):
                    print("Error Receiving \(error)")
                }

                self?.receive()
            })
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + 1 , execute: workItem)
    }
    
    func send(){
      
      let workItem = DispatchWorkItem{
          
          self.webSocket?.send(URLSessionWebSocketTask.Message.string(WebSocket.getInstrumentId), completionHandler: { error in
              
              
              if error == nil {
                  self.send()
              }else{
                  print(error)
              }
          })
      }
      
      DispatchQueue.global().asyncAfter(deadline: .now() + 3, execute: workItem)
    }
}
