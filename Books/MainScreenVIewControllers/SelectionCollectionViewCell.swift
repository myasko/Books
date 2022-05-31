//
//  SelectionCollectionViewCell.swift
//  Books
//
//  Created by Георгий Бутров on 30.05.2022.
//

import UIKit

class SelectionCollectionViewCell: UICollectionViewCell {
    static var name: String {
        return "SelectionCollectionViewCell"
    }
    
    lazy var titleLabel: UILabel! = {
        let label = UILabel()
        label.text = "Selection name"
        label.numberOfLines = 0
        label.font = label.font.withSize(17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var posterImage: UIImageView! = {
        let image = UIImageView(image: UIImage(named: "poster"))
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        contentView.addSubview(posterImage)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            
            posterImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            posterImage.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            posterImage.widthAnchor.constraint(equalToConstant: 75),
            
           
            titleLabel.leftAnchor.constraint(equalTo: posterImage.rightAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            ])
    }
}
