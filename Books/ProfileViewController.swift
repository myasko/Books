//
//  ProfileViewController.swift
//  Books
//
//  Created by Георгий Бутров on 11.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var nameLabel: UILabel! = {
        let label = UILabel()
        label.text = "Дима"
        label.font = label.font.withSize(17)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var ageLabel: UILabel! = {
        let label = UILabel()
        label.text = "18"
        label.font = label.font.withSize(17)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var mailLabel: UILabel! = {
        let label = UILabel()
        label.text = "test.test@gmai.com"
        label.font = label.font.withSize(17)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var photoImage: CircularImage = {
        let imgV = CircularImage()
        imgV.image = UIImage(named: "poster")
        imgV.clipsToBounds = true
        imgV.layer.masksToBounds = true
        imgV.contentMode = .scaleToFill
        imgV.translatesAutoresizingMaskIntoConstraints = false
        return imgV
    }()
    
    var secView: UIView! = {
        let view = UIView(frame: CGRect(x: 16, y: 20, width: 294, height: 472))
        view.backgroundColor = Colors.background2
        view.layer.cornerRadius = 10
        view.alpha = 0.7
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let exitButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "exit"), for: .normal)
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(logoutButtonAction), for: .touchUpInside)
        return btn
    }()
    
    let settingsButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "settings"), for: .normal)
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    
    let setImageButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Добавить фото", for: .normal)
        btn.setTitleColor(Colors.textColor, for: .normal )
        btn.backgroundColor = Colors.authButtonColor
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.backgroundColor = Colors.background1
    }
    
    private func setUpUI() {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = 10
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.addArrangedSubview(nameLabel)
        vStack.addArrangedSubview(ageLabel)
        vStack.addArrangedSubview(mailLabel)
        
        view.addSubview(secView)
        view.addSubview(photoImage)
        view.addSubview(setImageButton)
        view.addSubview(vStack)
        view.addSubview(exitButton)
        view.addSubview(settingsButton)
        let heigth = view.frame.height
        
        secView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        secView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        secView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        secView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 8.5/10).isActive = true
        
        NSLayoutConstraint.activate([
            photoImage.topAnchor.constraint(equalTo: secView.topAnchor, constant: 50),
            photoImage.centerXAnchor.constraint(equalTo: secView.centerXAnchor),
            photoImage.widthAnchor.constraint(equalToConstant: heigth * (1/3)),
            photoImage.heightAnchor.constraint(equalToConstant:  heigth * (1/3)),
            
            setImageButton.topAnchor.constraint(equalTo: photoImage.bottomAnchor, constant: 30),
            setImageButton.heightAnchor.constraint(equalToConstant: heigth / 20),
            setImageButton.widthAnchor.constraint(equalToConstant: heigth * (1/4)),
            setImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            vStack.topAnchor.constraint(equalTo: setImageButton.bottomAnchor, constant: 30),
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            exitButton.leftAnchor.constraint(equalTo: secView.leftAnchor, constant: 5),
            exitButton.topAnchor.constraint(equalTo: secView.topAnchor, constant: 5),
            exitButton.widthAnchor.constraint(equalToConstant: 30),
            exitButton.heightAnchor.constraint(equalToConstant: 30),
            
            settingsButton.topAnchor.constraint(equalTo: secView.topAnchor, constant: 5),
            settingsButton.rightAnchor.constraint(equalTo: secView.rightAnchor, constant: -5),
            settingsButton.widthAnchor.constraint(equalToConstant: 30),
            settingsButton.heightAnchor.constraint(equalToConstant: 30),
            
//            nameLabel.topAnchor.constraint(equalTo: setImageButton.bottomAnchor, constant: 20),
//            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
//            ageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        ])
        
    }
}

extension ProfileViewController {
    @objc func logoutButtonAction(sender: UIButton!) {
            
            let authVC = AuthorizationViewController()
            authVC.navigationItem.hidesBackButton = true
            self.navigationController?.pushViewController(authVC, animated: true)
    }
}

class CircularImage: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2
    }
}
