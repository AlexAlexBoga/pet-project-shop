//
//  TextFielWithIcon.swift
//  FashinShopPet
//
//  Created by Александр Богачев on 16.01.24.
//

import UIKit

class CustomTextField: UIView {
    
    private let backgroundView: UIView = UIView(frame: .zero)
    private let imageView: UIImageView = UIImageView(frame: .zero)
    private let textField: UITextField = UITextField(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    var iconImage: UIImage? {
        get {
            return imageView.image
        }
        set{
            return imageView.image = newValue
        }
    }
    
    var placeholder: String {
        get {
            textField.placeholder ?? ""
        }
        set{
            textField.placeholder = newValue
        }
    }
    
    var secureEntry: Bool {
        get {
            textField.isSecureTextEntry
        }
        set {
            textField.isSecureTextEntry = newValue
        }
    }
    
    var text: String {
        textField.text ?? ""
    }
    
    var borderWidth: CGFloat {
        get {
            backgroundView.layer.borderWidth
        }
        set {
            backgroundView.layer.borderWidth = newValue
        }
    }
    
    var cornerRadius: CGFloat {
        get {
            return backgroundView.layer.cornerRadius
        }
        set {
            backgroundView.layer.cornerRadius = newValue
        }
    }
    
    private func setupView() {
        backgroundColor = .clear
        clipsToBounds = false
        
        backgroundView.backgroundColor = .white
        backgroundView.layer.shadowRadius = 25.0
        backgroundView.layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
        backgroundView.layer.shadowOpacity = 1
        backgroundView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        backgroundView.layer.cornerRadius = 25.0
        backgroundView.layer.borderWidth = 2.0
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.leftAnchor.constraint(equalTo: leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: rightAnchor),
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        imageView.setContentHuggingPriority(.defaultLow + 1, for: .horizontal)
        imageView.setContentHuggingPriority(.defaultLow + 1, for: .vertical)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor,
                                               constant: 20.0),
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 20.0),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20.0),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(fieldTapped(_:)))
        backgroundView.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func fieldTapped(_ sender: UITapGestureRecognizer) {
        textField.becomeFirstResponder()
    }
    override var isFirstResponder: Bool {
        textField.isFirstResponder
    }
}
