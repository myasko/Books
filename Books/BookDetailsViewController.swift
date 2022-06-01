//
//  BookDetailsViewController.swift
//  Books
//
//  Created by Георгий Бутров on 30.05.2022.
//

import UIKit

class BookDetailsViewController: UIViewController {
    var presenter: BookDetailsPresenter!
    var book: Book!
    
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
        label.numberOfLines = 0
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
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
        label.font = label.font.withSize(12)
        label.textColor = Colors.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var annotationLabel: UILabel = {
        let label = UILabel()
        label.text = "аннотация"
        label.font = label.font.withSize(14)
        label.numberOfLines = 0
        label.textColor = Colors.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let annotationTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Аннотация"
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 17.0)
        label.numberOfLines = 0
        label.textColor = Colors.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addToSelectionButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("В подборку", for: .normal)
        btn.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        btn.titleLabel?.textColor = Colors.textColor
        btn.backgroundColor = Colors.bookDetailsButton
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var addToCartButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("В корзину", for: .normal)
        btn.titleLabel?.textColor = Colors.textColor
        btn.backgroundColor = Colors.bookDetailsButton
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        btn.isEnabled = true
        return btn
    }()
    
    let annotationBackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = Colors.cellBack
        view.alpha = 0.4
        return view
    }()
    
    let titleBackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = Colors.cellBack
        view.alpha = 0.4
        return view
    }()
    

    
    required init(book: Book) {
        super.init(nibName: nil, bundle: nil)
        
        self.presenter = BookDetailsPresenter(view: self, book: book)
        
        self.book = self.presenter.book
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.title = self.book.name
        setUpData()
        setUpUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpScrollView()
    }

    
    
    private func setUpScrollView() {
        contentView.backgroundColor = .red
        scrollView.backgroundColor = Colors.background1
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.isScrollEnabled = true
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    private func setUpData() {
        poster.image = UIImage(named: book.book_cover!)
        authorLabel.text = book.author!
        titleLabel.text = book.name!
        //genreLabel.text = book.genre.first
        priceLabel.text = "\(book.price!) Р"
        annotationLabel.text = book.annotation!
    }
    

    private func setUpUI() {
        let heigth = self.view.frame.height
        let width = self.view.frame.width
        
        contentView.addSubview(titleBackView)
        
        contentView.addSubview(poster)
        contentView.addSubview(authorLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(genreLabel)
        titleBackView.addSubview(priceLabel)
        contentView.addSubview(addToSelectionButton)
        contentView.addSubview(addToCartButton)
        contentView.addSubview(annotationBackView)
        contentView.addSubview(annotationLabel)
        contentView.addSubview(annotationTitleLabel)
        
        
        
        NSLayoutConstraint.activate([
            titleBackView.heightAnchor.constraint(equalToConstant: heigth * (1/6)),
            titleBackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            titleBackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            titleBackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            poster.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            poster.bottomAnchor.constraint(equalTo: titleBackView.bottomAnchor),
            poster.heightAnchor.constraint(equalToConstant: heigth * (1/5)),
            poster.widthAnchor.constraint(equalToConstant: heigth * (1/7.5)),
            
            authorLabel.leftAnchor.constraint(equalTo: poster.rightAnchor, constant: 10),
            authorLabel.topAnchor.constraint(equalTo: titleBackView.topAnchor, constant: 5),
            
            titleLabel.leftAnchor.constraint(equalTo: poster.rightAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 5),
            titleLabel.rightAnchor.constraint(equalTo: titleBackView.rightAnchor, constant: -5),
            
            genreLabel.leftAnchor.constraint(equalTo: poster.rightAnchor, constant: 10),
            genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            
            priceLabel.rightAnchor.constraint(equalTo: titleBackView.rightAnchor, constant: -5),
            priceLabel.bottomAnchor.constraint(equalTo: titleBackView.bottomAnchor, constant: -5),
            
            addToSelectionButton.topAnchor.constraint(equalTo: titleBackView.bottomAnchor, constant: 10),
            addToSelectionButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            addToSelectionButton.widthAnchor.constraint(equalToConstant: width * (46/100)),
            addToSelectionButton.heightAnchor.constraint(equalToConstant: heigth * (1/20)),
            
            addToCartButton.topAnchor.constraint(equalTo: titleBackView.bottomAnchor, constant: 10),
            addToCartButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            addToCartButton.widthAnchor.constraint(equalToConstant: width * (46/100)),
            addToCartButton.heightAnchor.constraint(equalToConstant: heigth * (1/20)),
            
            annotationBackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            annotationBackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            annotationBackView.topAnchor.constraint(equalTo: addToSelectionButton.bottomAnchor, constant: 10),
            
            annotationTitleLabel.topAnchor.constraint(equalTo: annotationBackView.topAnchor, constant: 5),
            annotationTitleLabel.centerXAnchor.constraint(equalTo: annotationBackView.centerXAnchor),
            
            annotationLabel.leftAnchor.constraint(equalTo: annotationBackView.leftAnchor, constant: 8),
            annotationLabel.rightAnchor.constraint(equalTo: annotationBackView.rightAnchor, constant: -8),
            annotationLabel.topAnchor.constraint(equalTo: annotationTitleLabel.bottomAnchor, constant: 5),
            annotationBackView.heightAnchor.constraint(equalTo: annotationLabel.heightAnchor, constant: 40),
        ])
        
    }
}

extension BookDetailsViewController {
    
    @objc func addToCart(sender: UIButton!) {
        //UserDefaults.standard.set(self.book, forKey: "cart")
        print("click")
    }
    
    
}
