//
//  HomeViewController.swift
//  Books
//
//  Created by Георгий Бутров on 11.04.2022.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    var presenter: HomePresenterProtocol! { get set }
}

class HomeViewController: UIViewController, HomeViewControllerProtocol {
    
    var presenter: HomePresenterProtocol!
    
    
    let popularLabel: UILabel! = {
        let label = UILabel()
        label.text = "Популярно сейчас"
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let selectionCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let col = UICollectionView(frame: .zero, collectionViewLayout: layout)
        col.isScrollEnabled = false
        col.backgroundColor = Colors.background1
        col.translatesAutoresizingMaskIntoConstraints = false
        col.register(SelectionCollectionViewCell.self, forCellWithReuseIdentifier: SelectionCollectionViewCell.name)
        col.showsHorizontalScrollIndicator = false
        
        return col
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let col = UICollectionView(frame: .zero, collectionViewLayout: layout)
        col.isScrollEnabled = true
        col.backgroundColor = Colors.background1
        col.translatesAutoresizingMaskIntoConstraints = false
        col.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.name)
        col.showsHorizontalScrollIndicator = false
        
        return col
    }()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Books"
        lbl.font = .systemFont(ofSize: 30)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let selectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Подборки"
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        selectionCollectionView.dataSource = self
        selectionCollectionView.delegate = self
        
        presenter = HomePresenter(view: self)
        
        setUpUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpScrollView()
    }
    private func setUpScrollView() {
        contentView.backgroundColor = Colors.background1
        scrollView.backgroundColor = Colors.background1
        navigationController?.isNavigationBarHidden = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
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
    
    private func setUpUI() {
        navigationController?.isNavigationBarHidden = true
        contentView.addSubview(popularLabel)
        contentView.addSubview(selectionLabel)
        contentView.addSubview(titleLabel)
        selectionCollectionView.backgroundColor = .clear
        
        contentView.addSubview(collectionView)
        contentView.addSubview(selectionCollectionView)
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            popularLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            popularLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            
            collectionView.topAnchor.constraint(equalTo: popularLabel.bottomAnchor, constant: 5),
            collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 4),
            
            selectionLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            selectionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            
            selectionCollectionView.heightAnchor.constraint(equalToConstant: CGFloat(Double(self.presenter.selections.count) * 200)),
            selectionCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            selectionCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            selectionCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            selectionCollectionView.topAnchor.constraint(equalTo: selectionLabel.bottomAnchor, constant: 10),
            


            ])
    }
}


extension HomeViewController: UICollectionViewDataSource & UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return self.presenter.popularBooks.count
        }
        if collectionView == self.selectionCollectionView {
            return self.presenter.selections.count
        }
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.name , for: indexPath) as! MainCollectionViewCell
            cell.poster.image = UIImage(named: self.presenter.popularBooks[indexPath.row].poster)!
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectionCollectionViewCell.name , for: indexPath) as! SelectionCollectionViewCell
        let selection = presenter.selections[indexPath.row]
        cell.titleLabel.text = selection.name
        cell.posterImage.image = UIImage(named: selection.poster)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionView {
            let clickedBook = self.presenter.popularBooks[indexPath.row]
        
            let detailsVC = BookDetailsViewController(book: clickedBook)
            navigationItem.title = ""
            detailsVC.title = clickedBook.name
            self.tabBarController?.tabBar.isHidden = true
        
            navigationController?.isNavigationBarHidden = false
       
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
        if collectionView == self.selectionCollectionView {
            let clickedSelection = self.presenter.selections[indexPath.row]
            
            
            let detailsVC = SelectionDetailsViewController(selection: clickedSelection)
            navigationItem.title = ""
            self.tabBarController?.tabBar.isHidden = true
            
            navigationController?.isNavigationBarHidden = false
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = self.view.frame.height

        if collectionView == self.collectionView {
            return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height - 10)
        }
        return CGSize(width: collectionView.frame.width - 10, height: height / 7)
    }
    
}
