//
//  SignUpViewController.swift
//  Books
//
//  Created by Георгий Бутров on 27.05.2022.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let logo: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "logo")
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let emailTextField: UITextField = {
        let txtf = UITextField()
        txtf.autocorrectionType = .no
        txtf.autocapitalizationType = .none
        txtf.keyboardType = UIKeyboardType.default
        txtf.placeholder = "E-mail"
        txtf.translatesAutoresizingMaskIntoConstraints = false
        txtf.textColor = Colors.textColor
        txtf.layer.cornerRadius = 5
        txtf.borderStyle = .roundedRect
        txtf.backgroundColor = .clear
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        txtf.leftViewMode = .always
        txtf.leftView = spacerView
        
        return txtf
    }()
    
    let userNameTextField: UITextField = {
        let txtf = UITextField()
        txtf.autocorrectionType = .no
        txtf.autocapitalizationType = .none
        txtf.keyboardType = UIKeyboardType.default
        txtf.placeholder = "Имя пользователя"
        txtf.translatesAutoresizingMaskIntoConstraints = false
        txtf.textColor = Colors.textColor
        txtf.layer.cornerRadius = 5
        txtf.borderStyle = .roundedRect
        txtf.backgroundColor = .clear
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        txtf.leftViewMode = .always
        txtf.leftView = spacerView
        
        return txtf
    }()
    
    let passworrdTextField: UITextField = {
        let txtf = UITextField()
        txtf.autocorrectionType = .no
        txtf.autocapitalizationType = .none
        txtf.keyboardType = UIKeyboardType.default
        txtf.isSecureTextEntry = true
        txtf.placeholder = "Введите пароль"
        txtf.translatesAutoresizingMaskIntoConstraints = false
        txtf.textColor = Colors.textColor
        txtf.layer.cornerRadius = 5
        txtf.backgroundColor = .clear
        txtf.borderStyle = .roundedRect
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        txtf.leftViewMode = .always
        txtf.leftView = spacerView
        return txtf
    }()
    
    let welcomeLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Welcome !"
        lbl.font = .systemFont(ofSize: 45)
        lbl.textColor = Colors.textColor
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var signInButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Зарегистрироваться", for: .normal)
        btn.titleLabel?.textColor = Colors.textColor
        btn.backgroundColor = Colors.authButtonColor
        //btn.addTarget(self, action: #selector(authButtonAction), for: .touchUpInside)
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = Colors.background1
        navigationItem.hidesBackButton = false
        navigationItem.backButtonTitle = ""
        setUpUI()
    }
    
    private func setUpUI() {
        self.tabBarController?.tabBar.isHidden = true
        view.addSubview(welcomeLabel)
        view.addSubview(emailTextField)
        view.addSubview(passworrdTextField)
        view.addSubview(signInButton)
        view.addSubview(logo)
        view.addSubview(userNameTextField)
        
        let heigth = self.view.frame.height
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalToConstant: 63),
            logo.heightAnchor.constraint(equalToConstant: 80),
            logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: (heigth * (1/10))),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            userNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            userNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            userNameTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            userNameTextField.heightAnchor.constraint(equalToConstant: 44),
            
            passworrdTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passworrdTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            passworrdTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            passworrdTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 15),
            passworrdTextField.heightAnchor.constraint(equalToConstant: 44),
            
            signInButton.heightAnchor.constraint(equalToConstant: 44),
            signInButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            signInButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            signInButton.topAnchor.constraint(equalTo: passworrdTextField.bottomAnchor, constant: 40)
        ])
    }
}
