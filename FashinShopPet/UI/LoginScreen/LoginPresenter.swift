//
//  LoginPresenter.swift
//  FashinShopPet
//
//  Created by Александр Богачев on 24.07.24.
//

import Foundation


class LoginPresenter {
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    
    let userRepository: UserRepository
    
    func login(name: String, password: String, confirmPassword: String) {
        if name.count > 0 && password.count > 0 && password == confirmPassword {
            userRepository.setUser(User(name: name, password: password))
            print("Login OK")
        } else {
            print("Username or password is wrong, can not login")
            
           
        }
    }
}
