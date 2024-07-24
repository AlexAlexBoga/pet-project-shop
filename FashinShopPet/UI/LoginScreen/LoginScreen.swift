//
//  LoginScreen.swift
//  FashinShopPet
//
//  Created by Александр Богачев on 18.01.24.
//

import UIKit

class LoginScreen: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
   
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [userNameTextField,
                                                  emailTextField,
                                                  passwordNameTextField,
                                                  confirmPasswordTextField,
                                                 ])
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 19
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let createLable = UILabel()
    private let pleaseLable = UILabel()
    private let agreeLable = UILabel()
    private let userNameTextField = CustomTextField()
    private let emailTextField = CustomTextField()
    private let passwordNameTextField = CustomTextField()
    private let confirmPasswordTextField = CustomTextField()
    private let buttonSignUp = UIButton()
    
    private let userRepository = UserRepository()
    lazy var loginPresenter = LoginPresenter(userRepository: userRepository)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundTapped(_:)))
        
        view.addGestureRecognizer(tapGesture)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillChangeFrame(_:)),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil)
        view.backgroundColor = .white
        
        stackViewSetting()
        textFieldsSetting()
        emailFieldsSetting()
        passwordFieldsSetting()
        confirmPasswordFieldsSetting()
        createLableSetting()
        pleaseLableSetting()
        buttonSignUpSetting()
        configureScrollview()
        configureContentView()
        agreeLableSetting()
    }
    
    private func configureScrollview() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func configureContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -80),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
    
    @objc func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(false)
    }
    
    private func stackViewSetting() {
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 37),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -37),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 270),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -312),
        ])
        
    }
    private func textFieldsSetting() {
        userNameTextField.heightAnchor.constraint(equalToConstant: 54).isActive = true
        userNameTextField.placeholder = "User name"
        if let image = UIImage(named: "usernameIcon") {
            userNameTextField.iconImage = image
        }
    }
    
    private func emailFieldsSetting() {
        emailTextField.placeholder = "Email"
        if let image = UIImage(named: "usernameIcon") {
            emailTextField.iconImage = image
        }
    }
    
    private func passwordFieldsSetting() {
        passwordNameTextField.placeholder = "Password"
        if let image = UIImage(named: "passwordIcon") {
            passwordNameTextField.iconImage = image
        }
    }
    
    private func confirmPasswordFieldsSetting() {
        confirmPasswordTextField.placeholder = "Confirm password"
        if let image = UIImage(named: "passwordIcon") {
            confirmPasswordTextField.iconImage = image
        }
    }
    
    private func createLableSetting() {
        createLable.text = "Create account"
        createLable.font = UIFont.systemFont(ofSize: 30)
        createLable.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(createLable)
        
        NSLayoutConstraint.activate([
            createLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 43),
            createLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 158),
        ])
    }
    
    private func pleaseLableSetting() {
        pleaseLable.text = "Please, sign up to continue."
        pleaseLable.font = UIFont.systemFont(ofSize: 17)
        pleaseLable.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pleaseLable)
        
        NSLayoutConstraint.activate([
            pleaseLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 43),
            pleaseLable.topAnchor.constraint(equalTo: createLable.bottomAnchor),
        ])
        
    }
    
    private func buttonSignUpSetting() {
        buttonSignUp.setTitle("Sign up", for: .normal)
        buttonSignUp.titleLabel?.font = UIFont.systemFont(ofSize: 26)
        buttonSignUp.backgroundColor = .black
        buttonSignUp.layer.cornerRadius = 25
        buttonSignUp.addTarget(self, action: #selector(signUpButtonTapp), for: .primaryActionTriggered)
        buttonSignUp.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(buttonSignUp)
        NSLayoutConstraint.activate([
            buttonSignUp.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 37),
            buttonSignUp.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -37),
            buttonSignUp.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 600),
            buttonSignUp.heightAnchor.constraint(equalToConstant: 54),
        ])
    }
    
    private func agreeLableSetting() {
        agreeLable.text = "I Agree with privacy and policy"
        agreeLable.textColor = .gray
        agreeLable.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(agreeLable)
        
        NSLayoutConstraint.activate([
            agreeLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37),
            agreeLable.topAnchor.constraint(equalTo: buttonSignUp.bottomAnchor, constant: 40),
        ])
    }
    
    @objc func signUpButtonTapp() {
        
        let name = userNameTextField.text
        let password = passwordNameTextField.text
        let confirmPassword = confirmPasswordTextField.text
        print ("signUpButtonTapp")
        print(name, password, confirmPassword)
        
        loginPresenter.login(name: name, password: password, confirmPassword: confirmPassword)
        let secondViewController = ShopListScreen()
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @objc
    func keyboardWillChangeFrame(_ notification: NSNotification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        
        scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0,
                                               bottom: scrollView.frame.maxY - keyboardFrame.minY, right: 0.0)
        
        let textFields = [userNameTextField,
                          emailTextField,
                          passwordNameTextField,
                          confirmPasswordTextField,]
        
        if let firstResponder = textFields
            .first(where: \.isFirstResponder) {
            
            let frame = firstResponder.frame.inset(by: UIEdgeInsets(top: -10,
                                                                    left: -10,
                                                                    bottom: -70,
                                                                    right: -10))
            
            let newOrigin = scrollView.convert(frame.origin, from: firstResponder.superview)
            let newFrame = CGRect(origin: newOrigin, size: frame.size)
            
            scrollView.scrollRectToVisible(newFrame, animated: true)
        }
    }
}


