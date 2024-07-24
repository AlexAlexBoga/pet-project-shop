//
//  SignInScreen.swift
//  FashinShopPet
//
//  Created by Александр Богачев on 3.01.24.
//

import UIKit

class SignInScreen: UIViewController {
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [userNameTextField,
                                                  passwordTextField,
                                                 ])
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 29
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let horizontalTopLine = UIView()
    private let horizontalDownLine = UIView()
    private let welcomTextLable = UILabel()
    private let pleaseTextLable = UILabel()
    private let signInLable = UILabel()
    private let userNameTextField = CustomTextField()
    private let passwordTextField = CustomTextField()
    private let signInButton = UIButton()
    private let signUpButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundTapped(_:)))
        
        view.addGestureRecognizer(tapGesture)
        
        horizontalSetup()
        horizontalDownSetup()
        welcomTextLableSetting()
        signInLableSetup()
        shoppingTextLableSetting()
        startedButtonSetting1()
        addStackView()
        setupConstraints()
        signUpButtonSetup()
        userNameConfig()
        passwordConfig()
        
        title = "Sign In"
        let nextButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextButtonTapped))
        navigationItem.rightBarButtonItem = nextButton
    }
    
    @objc func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(false)
    }
    
    @objc func nextButtonTapped() {
        let signUpViewController = LoginScreen()
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    private func userNameConfig() {
        userNameTextField.placeholder = "User name"
        if let image = UIImage(named: "usernameIcon") {
            userNameTextField.iconImage = image
        }
    }
    
    private func passwordConfig() {
        passwordTextField.placeholder = "Password"
        if let image = UIImage(named: "passwordIcon") {
            passwordTextField.iconImage = image
        }
    }
    
    private func horizontalSetup() {
        horizontalTopLine.backgroundColor = .black
        view.addSubview(horizontalTopLine)
        horizontalTopLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            horizontalTopLine.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            horizontalTopLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            horizontalTopLine.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            horizontalTopLine.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 105),
        ])
    }
    
    private func horizontalDownSetup() {
        horizontalDownLine.backgroundColor = .black
        view.addSubview(horizontalDownLine)
        horizontalDownLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            horizontalDownLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            horizontalDownLine.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            horizontalDownLine.topAnchor.constraint(equalTo: view.topAnchor, constant: 750),
            horizontalDownLine.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 755),
        ])
    }
    
    private func welcomTextLableSetting() {
        welcomTextLable.text = "Welcome back!"
        welcomTextLable.font = UIFont.systemFont(ofSize: 30)
        welcomTextLable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomTextLable)
        
        NSLayoutConstraint.activate([
            welcomTextLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            welcomTextLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 158),
        ])
    }
    
    private func shoppingTextLableSetting() {
        pleaseTextLable.text = "Please, sign in to continue."
        pleaseTextLable.font = UIFont.systemFont(ofSize: 17)
        pleaseTextLable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pleaseTextLable)
        
        NSLayoutConstraint.activate([
            pleaseTextLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            pleaseTextLable.topAnchor.constraint(equalTo: welcomTextLable.bottomAnchor),
        ])
    }
    
    private func signInLableSetup() {
        signInLable.text = "Don’t have an account?"
        signInLable.textColor = .gray
        view.addSubview(signInLable)
        signInLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signInLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37),
            signInLable.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -180),
        ])
    }
    
    private func startedButtonSetting1() {
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 26)
        signInButton.backgroundColor = .black
        signInButton.layer.cornerRadius = 25
        signInButton.addTarget(self, action: #selector(startedButtonTap1), for: .primaryActionTriggered)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signInButton)
        
        NSLayoutConstraint.activate([
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -37),
            signInButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            signInButton.heightAnchor.constraint(equalToConstant: 54),
        ])
    }
    
    @objc
    func startedButtonTap1() {
        let secondViewController = ShopListScreen()
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    private func signUpButtonSetup() {
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.setTitleColor(UIColor.gray, for: .normal)
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .primaryActionTriggered)
        
        NSLayoutConstraint.activate([
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -37),
            signUpButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -188),
        ])
    }
    
    @objc func signUpButtonTapped() {
        let secondViewController = LoginScreen()
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -37),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 263),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -452),
        ])
    }
    
    private func addStackView() {
        view.addSubview(stackView)
    }
    
}





