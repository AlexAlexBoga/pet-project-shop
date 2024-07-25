//
//  LoginPresenter.swift
//  FashinShopPet
//
//  Created by Александр Богачев on 24.07.24.
//

import Foundation

protocol LoginScreenView: Screen<LoginPresenter> {
//    func goToHomeScreen() -> any ShopListScreenView
    func showLoginError()
}

class LoginPresenter {
    
    let userRepository: UserRepository
    private weak var view: (any LoginScreenView)?
    
    init(view: any LoginScreenView, userRepository: UserRepository) {
        self.view = view
        self.userRepository = userRepository
    }
    
    
    
    
    public func login(name: String, password: String, confirmPassword: String) {
        if name.count > 0 && password.count > 0 && password == confirmPassword {
            userRepository.setUser(User(name: name, password: password))
            print("Login OK")
        } else {
            print("Username or password is wrong, can not login")
            
           
        }
    }

    
}
