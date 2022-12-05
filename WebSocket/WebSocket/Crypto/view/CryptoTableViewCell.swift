//
//  CryptoTableViewCell.swift
//  WebSocket
//
//  Created by Murilo de Souza Lopes on 03/12/22.
//

import Foundation
import UIKit

class CryptoTableViewCell : UITableViewCell {
    
    static let idCell = "cell"
    
    //MARK: Objects
    var image:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        return img
    }()
    
    var title:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var subTitle:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.black
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let variation:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let price:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    var viewBackground = UIView()
    var viewBackgroundBorder = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populate(coin: Coin) {
        if let imageLoad = UIImage(named: String(coin.InstrumentId)) {
            image.image = imageLoad
        } else {
            image.image =  UIImage(named: "6")
        }
        title.text = coin.Product1Symbol
        subTitle.text = coin.Product1Symbol
        variation.text = "+1"
        price.text = "R$ 1,00"
        setupUI()
        setupConstraints()
    }
    
    func setupUI(){
        contentView.addSubview(image)
        containerView.addSubview(title)
        containerView.addSubview(subTitle)
        contentView.addSubview(containerView)
        contentView.addSubview(variation)
        contentView.addSubview(price)
        
    }
    
    func setupConstraints(){
        image.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        image.widthAnchor.constraint(equalToConstant:40).isActive = true
        image.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.image.trailingAnchor, constant:10).isActive = true

        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        title.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        subTitle.topAnchor.constraint(equalTo:self.title.bottomAnchor).isActive = true
        subTitle.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        subTitle.topAnchor.constraint(equalTo:self.title.bottomAnchor).isActive = true
        
        variation.leadingAnchor.constraint(equalTo:self.containerView.trailingAnchor, constant: 5).isActive = true
        variation.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor).isActive = true

        price.widthAnchor.constraint(equalToConstant:150).isActive = true
        price.heightAnchor.constraint(equalToConstant:26).isActive = true
        price.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        price.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor).isActive = true
    }
}
