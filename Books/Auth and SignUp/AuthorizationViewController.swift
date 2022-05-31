//
//  AuthorizationViewController.swift
//  Books
//
//  Created by Георгий Бутров on 27.05.2022.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
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
        //txtf.textAlignment = .center
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
    
    let signInButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Войти", for: .normal)
        btn.titleLabel?.textColor = Colors.textColor
        btn.backgroundColor = Colors.authButtonColor
        btn.addTarget(self, action: #selector(authButtonAction), for: .touchUpInside)
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let signUpLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Еще нет аккаунта?"
        lbl.font = .systemFont(ofSize: 14)
        lbl.textColor = Colors.textColor
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let signUpButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Зарегистрироваться", for: .normal)
        btn.titleLabel?.textColor = Colors.textColor
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        btn.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .clear
        return btn
    }()
    
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = Colors.background1
        navigationItem.hidesBackButton = true
        setUpUI()
    }
    
    private func setUpUI() {
        self.tabBarController?.tabBar.isHidden = true
        view.addSubview(welcomeLabel)
        view.addSubview(emailTextField)
        view.addSubview(passworrdTextField)
        view.addSubview(signInButton)
        view.addSubview(logo)
        view.addSubview(signUpLabel)
        view.addSubview(signUpButton)
        
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
            
            passworrdTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passworrdTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            passworrdTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            passworrdTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passworrdTextField.heightAnchor.constraint(equalToConstant: 44),
            
            signInButton.heightAnchor.constraint(equalToConstant: 44),
            signInButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            signInButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            signInButton.topAnchor.constraint(equalTo: passworrdTextField.bottomAnchor, constant: 40),
            
            signUpLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(heigth * (1/16))),
            signUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signUpButton.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 1),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension AuthorizationViewController {
    
    @objc func authButtonAction(sender: UIButton!) {
        if emailTextField.text == "test.test@gmail.com" && passworrdTextField.text == "qwerty1234" {
            self.tabBarController?.tabBar.isHidden = false
            self.navigationController?.popViewController(animated: true)

        }
    }
    
    @objc func signUpButtonAction(sender: UIButton!) {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
