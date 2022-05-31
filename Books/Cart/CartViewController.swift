//
//  BasketViewController.swift
//  Books
//
//  Created by Георгий Бутров on 11.04.2022.
//

import UIKit

class CartViewController: UIViewController {
    var presenter: CartPresenter!
    
    let cartCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let col = UICollectionView(frame: .zero, collectionViewLayout: layout)
        col.isScrollEnabled = true
        col.backgroundColor = Colors.background1
        col.translatesAutoresizingMaskIntoConstraints = false
        col.register(CartCollectionViewCell.self, forCellWithReuseIdentifier: CartCollectionViewCell.name)
        return col
    }()
    
    let deletAllButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Удалить все", for: .normal)
        btn.setTitleColor(.red, for: .normal )
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(deleteAll), for: .touchUpInside)
        return btn
    }()
    
    let buyButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Перейти к оформлению", for: .normal)
        btn.setTitleColor(Colors.textColor, for: .normal )
        btn.backgroundColor = Colors.authButtonColor
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var cartView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.cellBack
        view.alpha = 0.4
        view.layer.cornerRadius = 10
        return view
    }()
    
    let urCartLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17)
        lbl.text = "Ваша корзина"
        lbl.textColor = Colors.textColor
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let totalСostLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17)
        lbl.text = "Общая стоимость"
        lbl.textColor = Colors.textColor
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var totalCostVarLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14)
        lbl.text = "150 Р"
        lbl.textColor = Colors.textColor
        lbl.textAlignment = .right
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var urCartVarLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14)
        lbl.text = "3 товара на 150 Р"
        lbl.textColor = Colors.textColor
        lbl.textAlignment = .right
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let discountLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17)
        lbl.text = "Скидка"
        lbl.textColor = Colors.textColor
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CartPresenter(view: self)
        cartCollectionView.dataSource = self
        cartCollectionView.delegate = self
        setUpData()
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.backgroundColor = Colors.background1
    }
    
    func setUpData() {
        totalCostVarLabel.text = "\(presenter.getTotalPrice()) Р"
        urCartVarLabel.text = "\(presenter.booksInCart.count) книги на \(presenter.getTotalPrice()) Р"
    }
    
    func setUpUI() {
        let heigth = self.view.frame.height
        self.title = "Корзина"
        
        view.addSubview(deletAllButton)
        view.addSubview(cartCollectionView)
        view.addSubview(cartView)
        view.addSubview(buyButton)
        view.addSubview(urCartLabel)
        view.addSubview(totalСostLabel)
        view.addSubview(discountLabel)
        view.addSubview(urCartVarLabel)
        view.addSubview(totalCostVarLabel)
        
        NSLayoutConstraint.activate([
            deletAllButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            deletAllButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            deletAllButton.heightAnchor.constraint(equalToConstant: 20),
            deletAllButton.widthAnchor.constraint(equalToConstant: 110),
            
            buyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            buyButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            buyButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            buyButton.heightAnchor.constraint(equalToConstant: heigth * (1/14)),
            
            cartView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            cartView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            cartView.heightAnchor.constraint(equalToConstant: heigth / 5),
            cartView.bottomAnchor.constraint(equalTo: buyButton.topAnchor, constant: -10),
            
            urCartLabel.topAnchor.constraint(equalTo: cartView.topAnchor, constant: 10),
            urCartLabel.leftAnchor.constraint(equalTo: cartView.leftAnchor, constant: 10),
            
            urCartVarLabel.leftAnchor.constraint(equalTo: urCartLabel.rightAnchor, constant: 20),
            urCartVarLabel.topAnchor.constraint(equalTo: cartView.topAnchor, constant: 10),
            urCartVarLabel.rightAnchor.constraint(equalTo: cartView.rightAnchor, constant: -10),
            
            discountLabel.leftAnchor.constraint(equalTo: cartView.leftAnchor, constant: 10),
            discountLabel.topAnchor.constraint(equalTo: urCartLabel.bottomAnchor, constant: 10),
            
            totalСostLabel.leftAnchor.constraint(equalTo: cartView.leftAnchor, constant: 10),
            totalСostLabel.bottomAnchor.constraint(equalTo: cartView.bottomAnchor, constant: -10),
            
            totalCostVarLabel.leftAnchor.constraint(equalTo: totalСostLabel.rightAnchor, constant: 20),
            totalCostVarLabel.bottomAnchor.constraint(equalTo: cartView.bottomAnchor, constant: -10),
            totalCostVarLabel.rightAnchor.constraint(equalTo: cartView.rightAnchor, constant: -10),
            
            cartCollectionView.topAnchor.constraint(equalTo: deletAllButton.bottomAnchor, constant: 10),
            cartCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            cartCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            cartCollectionView.bottomAnchor.constraint(equalTo: cartView.topAnchor, constant: -10),
            
        ])
        
    }
    
    
}

extension CartViewController:  UICollectionViewDataSource & UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.booksInCart.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CartCollectionViewCell.name, for: indexPath) as! CartCollectionViewCell
        cell.poster.image = UIImage(named: presenter.booksInCart[indexPath.row].poster)
        cell.authorLabel.text = presenter.booksInCart[indexPath.row].author
        cell.titleLabel.text = presenter.booksInCart[indexPath.row].name
        cell.genreLabel.text = presenter.booksInCart[indexPath.row].genre.first
        cell.priceLabel.text = "\(presenter.booksInCart[indexPath.row].price) Р"
        cell.removeBookButton.addTarget(self, action: #selector(removeBook), for: .touchUpInside)
        cell.removeBookButton.tag = indexPath.row
        return cell
    }
}

extension CartViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 10, height: self.view.frame.height / 6.7)
    }
}

extension CartViewController {
    
    @objc func deleteAll(sender: UIButton!) {
        presenter.booksInCart.removeAll()
        totalCostVarLabel.text = ""
        urCartVarLabel.text = ""
        cartCollectionView.reloadData()
        viewDidAppear(true)
        print("hoba")
    }
    
    @objc func removeBook(sender: UIButton!) {
        presenter.removeBookFromCart(index: sender.tag)
        cartCollectionView.reloadData()
        viewDidAppear(true)
    }
}
