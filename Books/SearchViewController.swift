//
//  CompilationViewController.swift
//  Books
//
//  Created by Георгий Бутров on 11.04.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchTextField: UITextField = {
        let txtf = UITextField()
        txtf.autocorrectionType = .no
        txtf.autocapitalizationType = .none
        txtf.keyboardType = UIKeyboardType.default
        txtf.placeholder = "Книга, автор, жанр"
        txtf.translatesAutoresizingMaskIntoConstraints = false
        txtf.textColor = Colors.textColor2
        txtf.layer.cornerRadius = 5
        txtf.borderStyle = .roundedRect
        txtf.backgroundColor = Colors.background2
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
//        let image = UIImageView()
//        image.image = UIImage(named: "search")
//        spacerView.addSubview(image)
        txtf.leftViewMode = .always
        txtf.leftView = spacerView
        return txtf
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.background1
        
        setUpUI()
    }
    
    private func setUpUI() {
        let heigth = self.view.frame.height
        view.addSubview(searchTextField)
        
        searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: (heigth * (1/20))).isActive = true
        searchTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        searchTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}
