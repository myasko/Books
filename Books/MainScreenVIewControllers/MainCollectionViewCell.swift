//
//  MainCollectionViewCell.swift
//  Books
//
//  Created by Георгий Бутров on 28.05.2022.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    static var name: String {
        return "MainCollectionViewCell"
    }
    
    var poster: UIImageView = {
        let imgV = UIImageView(image: UIImage(named: "poster"))
        imgV.clipsToBounds = true
        imgV.layer.masksToBounds = true
        imgV.layer.cornerRadius = 10
        imgV.contentMode = .scaleToFill
        imgV.translatesAutoresizingMaskIntoConstraints = false
        
        return imgV
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
        contentView.addSubview(poster)
        poster.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        poster.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        poster.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        poster.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}



