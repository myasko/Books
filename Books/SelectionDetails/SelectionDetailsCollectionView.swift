//
//  SelectionDetailsCollectionView.swift
//  Books
//
//  Created by Георгий Бутров on 30.05.2022.
//

import UIKit

class SelectionDetailsCollectionView: UICollectionViewCell {
    
    static var name: String {
        return "SelectionDetailsCollectionViewCell"
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
        label.numberOfLines = 1
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
        
        NSLayoutConstraint.activate([
            poster.topAnchor.constraint(equalTo: contentView.topAnchor),
            poster.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            poster.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            poster.widthAnchor.constraint(equalToConstant: 75),
            
            authorLabel.leftAnchor.constraint(equalTo: poster.rightAnchor, constant: 10),
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            
            titleLabel.leftAnchor.constraint(equalTo: poster.rightAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 5),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            
            genreLabel.leftAnchor.constraint(equalTo: poster.rightAnchor, constant: 10),
            genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            
            priceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
}

extension SelectionDetailsViewController: UICollectionViewDataSource & UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return self.presenter.selection.books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectionDetailsCollectionView.name , for: indexPath) as! SelectionDetailsCollectionView
        let book = presenter.selection.books[indexPath.row]
        
        cell.poster.image = UIImage(named: book.poster)
        cell.titleLabel.text = book.name
        cell.authorLabel.text = book.author
        cell.priceLabel.text = "\(book.price) Р"
        cell.genreLabel.text = book.genre.first
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let clickedBook = self.presenter.selection.books[indexPath.row]
        
        
        let detailsVC = BookDetailsViewController(book: clickedBook)
        navigationItem.title = ""
        detailsVC.title = clickedBook.name
        self.tabBarController?.tabBar.isHidden = true
        
        navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension SelectionDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 10, height: collectionView.frame.height / 5)
    }
}
