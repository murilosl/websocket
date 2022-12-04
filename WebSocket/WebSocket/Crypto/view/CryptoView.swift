//
//  CryptoView.swift
//  WebSocket
//
//  Created by Murilo de Souza Lopes on 03/12/22.
//

import Foundation
import UIKit

class CryptoView: UIView {
    
    var tableView: UITableView
    
    override init(frame: CGRect) {
        self.tableView = UITableView()
        super.init(frame: frame)
        self.setupUI()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        addSubview(tableView)
        backgroundColor = .lightGray
    }
    
    func setupConstraints(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        
        tableView.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
    }
}
