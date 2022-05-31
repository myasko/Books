//
//  CartCollectionViewCell.swift
//  Books
//
//  Created by Георгий Бутров on 30.05.2022.
//

import UIKit

class CartCollectionViewCell: UICollectionViewCell {
    static var name: String {
        return "CartCollectionViewCell"
    }
    
    var poster: UIImageView = {
        let imgV = UIImageView()
        imgV.clipsToBounds = true
        imgV.layer.masksToBounds = true
        imgV.layer.cornerRadius = 10
        imgV.contentMode = .scaleToFill
        imgV.translatesAutoresizingMaskIntoConstraints = false
        return imgV
    }()
    
    var authorLabel: UILabel = {
        let label = UILabel()
        label.text = "Автор"
        label.font = label.font.withSize(12)
        label.textColor = Colors.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Название книги"
        label.font = label.font.withSize(15)
        label.textColor = Colors.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var genreLabel: UILabel = {
        let label = UILabel()
        label.text = "Жанры книги"
        label.font = label.font.withSize(12)
        label.textColor = Colors.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "цена"
        label.font = label.font.withSize(14)
        label.textColor = Colors.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var removeBookButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Удалить", for: .normal)
        btn.setTitleColor(.red, for: .normal )
        btn.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 14)
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    private func layout() {
        contentView.backgroundColor = Colors.cellBack2
        contentView.layer.cornerRadius = 10
        contentView.addSubview(poster)
        contentView.addSubview(authorLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(genreLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(removeBookButton)
        
        NSLayoutConstraint.activate([
            poster.topAnchor.constraint(equalTo: contentView.topAnchor),
            poster.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            poster.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            poster.widthAnchor.constraint(equalToConstant: 75),
            
            authorLabel.leftAnchor.constraint(equalTo: poster.rightAnchor, constant: 10),
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            
            titleLabel.leftAnchor.constraint(equalTo: poster.rightAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 5),
            
            genreLabel.leftAnchor.constraint(equalTo: poster.rightAnchor, constant: 10),
            genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            
            priceLabel.leftAnchor.constraint(equalTo: poster.rightAnchor, constant: 10),
            priceLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 5),
            
            removeBookButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            removeBookButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10)
        ])
    }
}

