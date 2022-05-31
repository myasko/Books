//
//  SelectionDetailsViewController.swift
//  Books
//
//  Created by Георгий Бутров on 27.05.2022.
//

import UIKit

class SelectionDetailsViewController: UIViewController {
    
    var presenter: SelectionDetailsPresenter!
    var selection: Selection!
    
    var Books: [Book] = []
    
    let poster: UIImageView = {
        let imgV = UIImageView()
        imgV.clipsToBounds = true
        imgV.layer.masksToBounds = true
        imgV.layer.cornerRadius = 10
        imgV.contentMode = .scaleToFill
        imgV.translatesAutoresizingMaskIntoConstraints = false
        return imgV
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Аннотация"
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        label.numberOfLines = 0
        label.textColor = Colors.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let selectionCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let col = UICollectionView(frame: .zero, collectionViewLayout: layout)
        col.isScrollEnabled = true
        col.backgroundColor = Colors.background1
        col.translatesAutoresizingMaskIntoConstraints = false
        col.register(SelectionDetailsCollectionView.self, forCellWithReuseIdentifier: SelectionDetailsCollectionView.name)
        
        return col
    }()
    
    required init(selection: Selection) {
        super.init(nibName: nil, bundle: nil)
        
        self.presenter = SelectionDetailsPresenter(view: self, selection: selection)
        self.selection = self.presenter.getSelectionDetails()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectionCollectionView.dataSource = self
        selectionCollectionView.delegate = self
        view.backgroundColor = Colors.background1
        setUpUI()
    }
    
    private func setUpUI() {
        let heigth = self.view.frame.height

        
        view.addSubview(titleLabel)
        titleLabel.text = selection.name
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: heigth * (1/20)).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(poster)
        poster.image = UIImage(named: selection.poster)
        poster.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        poster.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: heigth * (1/25)).isActive = true
        poster.heightAnchor.constraint(equalToConstant: heigth * (1/3)).isActive = true
        poster.widthAnchor.constraint(equalToConstant: heigth * (1/5)).isActive = true
        
        view.addSubview(selectionCollectionView)
        selectionCollectionView.backgroundColor = Colors.background1
        selectionCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selectionCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        //bookTableView.heightAnchor.constraint(equalToConstant: CGFloat(Double(self.presenter.selection.books.count) * 200)).isActive = true
        selectionCollectionView.topAnchor.constraint(equalTo: poster.bottomAnchor, constant: 20).isActive = true
        selectionCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        

        
    }
}


