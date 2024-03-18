//
//  CustomButton.swift
//  FashinShopPet
//
//  Created by Александр Богачев on 16.01.24.
//

import UIKit

class CustomButton: UIView {
    
    let button: UIButton = UIButton(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupButton()
    }
    
    var title: String {
        get {
            return button.title(for: .normal) ?? ""
        }
        set {
            button.setTitle(newValue, for: .normal)
        }
    }
    
    private func setupButton() {
        button.titleLabel?.font = UIFont.systemFont(ofSize: 26)
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
