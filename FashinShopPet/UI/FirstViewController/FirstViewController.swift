//
//  FirstViewController.swift
//  FashinShopPet
//
//  Created by Александр Богачев on 29.12.23.
//

import UIKit

class FirstViewController: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    private let presentTextLable = UILabel()
    private let getStartedButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImage()
        presentTextLableSetting()
        startedButtonSetting()
        settingConstraint()
    }
    
    private func backgroundImage() {
        let backgroudImage = UIImageView(frame: UIScreen.main.bounds)
        backgroudImage.contentMode = .scaleAspectFit
        backgroudImage.clipsToBounds = true
        backgroudImage.image = UIImage(named: "mainScreen")
        self.view.addSubview(backgroudImage)
        self.view.sendSubviewToBack(backgroudImage)   // Фоновый рисунок
    }
    
    private func settingConstraint() {
        NSLayoutConstraint.activate([
            presentTextLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            presentTextLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            presentTextLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 583),
            presentTextLable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -171),
        ])
    }
    
    private func presentTextLableSetting() {
        presentTextLable.text = "Make your \nshopping easy!"
        presentTextLable.numberOfLines = 2
        presentTextLable.backgroundColor = .clear
        presentTextLable.font = UIFont.systemFont(ofSize: 40)
        presentTextLable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(presentTextLable)
    }
    
    private func startedButtonSetting() {
        getStartedButton.button.setTitle("Get started", for: .normal)
        getStartedButton.button.addTarget(self, action: #selector(startedButtonTap), for: .primaryActionTriggered)
        
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(getStartedButton)
        
        NSLayoutConstraint.activate([
            getStartedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            getStartedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            getStartedButton.topAnchor.constraint(equalTo: presentTextLable.bottomAnchor,
                                                  constant: 49),
            getStartedButton.heightAnchor.constraint(equalToConstant: 54),
        ])
    }
    
    @objc
    func startedButtonTap() {
        let secondViewController = SignInViewController()
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
}

