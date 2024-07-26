//
//  AppRouter.swift
//  FashinShopPet
//
//  Created by Александр Богачев on 25.07.24.
//

import UIKit


protocol AppRouterProtocol {
    func showMainScreen(from viewController: UIViewController)
    func showLoginScreen(from viewController: UIViewController)
    func showShopListScreen(from viewController: UIViewController)
    func showSingInScreen(from viewController: UIViewController)
}

class AppRouter: AppRouterProtocol {
    
    func showSingInScreen(from viewController: UIViewController) {
        let singInScreen = SignInScreen(router: self)
        if let navigationController = viewController.navigationController {
            navigationController.pushViewController(singInScreen, animated: true)
        } else {
            print("Error: viewController does not have a navigationController")
        }
    }
    
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func showMainScreen(from viewController: UIViewController) {
        let mainScreen = MainScreen(router: self)
        if let navigationController = viewController.navigationController {
            navigationController.pushViewController(mainScreen, animated: true)
        } else {
            print("Error: viewController does not have a navigationController")
        }
    }
    
    func showLoginScreen(from viewController: UIViewController) {
        let loginPresenter = LoginPresenter(userRepository: userRepository)
        
        // Проверяем соответствие протоколу
        guard let loginPresenterProtocol = loginPresenter as? LoginPresenterProtocol else {
            print("Error: loginPresenter does not conform to LoginPresenterProtocol")
            return
        }
        
        let loginScreen = LoginScreen(presenter: loginPresenterProtocol)
        
        // Проверяем наличие navigationController
        if let navigationController = viewController.navigationController {
            navigationController.pushViewController(loginScreen, animated: true)
        } else {
            print("Error: viewController does not have a navigationController")
        }
    }
    
    func showShopListScreen(from viewController: UIViewController) {
        let shopListScreen = ShopListScreen()
        
        // Проверяем наличие navigationController
        if let navigationController = viewController.navigationController {
            navigationController.pushViewController(shopListScreen, animated: true)
        } else {
            print("Error: viewController does not have a navigationController")
        }
    }
}
