//
//  CryptoViewController.swift
//  WebSocket
//
//  Created by Murilo de Souza Lopes on 03/12/22.
//

import Foundation
import UIKit

class CryptoViewController : UIViewController{
    
    var crypto: [Crypto]!
    var mock = CrytoMock.getCrypto()
    var webSocket: WebSocket!
    let cryptoView = CryptoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCryptoView()
        webSocket = WebSocket(url: WebSocketConstants.url, delegate: self)
        webSocket.delegateMessage = self
    }
    
    override func loadView() {
        view = cryptoView
    }
    
    func setupCryptoView() {
        navigationItem.title = "Cotação"
        cryptoView.tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.idCell)
        cryptoView.tableView.dataSource = self
        cryptoView.tableView.delegate = self
    }
}

extension CryptoViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension CryptoViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mock.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.idCell, for: indexPath) as? CryptoTableViewCell {

                let item = mock[indexPath.row]
                cell.populate(crypto: item)

                return cell
                
            } else {
                return UITableViewCell()
            }
            
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}

extension CryptoViewController : URLSessionWebSocketDelegate{
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("Connected to server")
        webSocket.receive()
        webSocket.send()
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        print("Disconnect Server")
    }
}

extension CryptoViewController : WebSocketMessageDelegate {
    func onMessage(text: String) {
        print(text)
    }
}
