//
//  ShopListViewController.swift
//  FashinShopPet
//
//  Created by Александр Богачев on 24.01.24.
//

import UIKit

class ShopListViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var modelStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [pantsImageView,
                                                  shirtsImageView,
                                                  shoesImageView,
                                                  socksImageView,
                                                 ])
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 30
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let goodTextLable = UILabel()
    private let searchTextField = UITextField()
    private let searchImageView = UIImageView()
    private let propositionImageView = UIImageView()
    private let textField = UITextField()
    private let testButton = CustomButton()
    private let pantsImageView = UIImageView()
    private let shirtsImageView = UIImageView()
    private let shoesImageView = UIImageView()
    private let socksImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupCollectionView()
        configGoodTextLable()
        connfigSeachTextField()
        testButtonSetting()
        imageDiscountConfig()
        configPantsImageView()
        configShirtsImageView()
        configShoesImageView()
        configSocksImageView()
        configPropositionImageView()
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.reuseIdentifier)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 1),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            collectionView.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
    
    func imageDiscountConfig() {
        modelStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(modelStackView)
        
        NSLayoutConstraint.activate([
            modelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            modelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            modelStackView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 370),
            modelStackView.heightAnchor.constraint(equalToConstant: 65),
        ])
    }
    
    func configPropositionImageView() {
        propositionImageView.image = UIImage(named: "")
        propositionImageView.backgroundColor = .darkGray
        propositionImageView.layer.cornerRadius = 17
        propositionImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(propositionImageView)
        
        NSLayoutConstraint.activate([
            propositionImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            propositionImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            propositionImageView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 30),
            propositionImageView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    func configGoodTextLable() {
        goodTextLable.text = "Good morning!"
        goodTextLable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(goodTextLable)
        
        NSLayoutConstraint.activate([
            goodTextLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            goodTextLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        ])
    }
    
    func connfigSeachTextField() {
        searchTextField.backgroundColor = .white
        searchTextField.layer.shadowRadius = 25
        searchTextField.layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
        searchTextField.layer.shadowOpacity = 1
        searchTextField.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        searchTextField.layer.cornerRadius = 17
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchTextField)
        
        NSLayoutConstraint.activate([
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchTextField.heightAnchor.constraint(equalToConstant: 32),
        ])
        
        searchImageView.image = UIImage(named: "searchIcon")
        searchImageView.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.addSubview(searchImageView)
        
        NSLayoutConstraint.activate([
            searchImageView.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor, constant: 20.0),
            searchImageView.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
        ])
        
        searchImageView.setContentHuggingPriority(.defaultLow + 1, for: .horizontal)
        searchImageView.setContentHuggingPriority(.defaultLow + 1, for: .vertical)
        textField.placeholder = "search"
        textField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: searchImageView.trailingAnchor, constant: 10),
            textField.topAnchor.constraint(equalTo: searchTextField.topAnchor, constant: 10),
            textField.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
        ])
    }
    
    func testButtonSetting() {
        testButton.button.setTitle("Temp", for: .normal)
        testButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(testButton)
        
        testButton.button.addTarget(self, action: #selector(startedButtonTap), for: .primaryActionTriggered)
        
        NSLayoutConstraint.activate([
            testButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            testButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            testButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 700),
            testButton.heightAnchor.constraint(equalToConstant: 54),
        ])
    }
    
    @objc
    func startedButtonTap() {
        let secondViewController = SignInViewController()
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    func configPantsImageView() {
        pantsImageView.image = UIImage(named: "pantsIcon")
        pantsImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pantsImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pantsImageView.backgroundColor = .clear
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        pantsImageView.isUserInteractionEnabled = true
        pantsImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func imageTapped(_ gesture: UITapGestureRecognizer ) {
        print("Image Tapped")
    }
    
    func configShirtsImageView() {
        shirtsImageView.image = UIImage(named: "shirtsIcon")
        shirtsImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        shirtsImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        shirtsImageView.backgroundColor = .clear
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped1))
        shirtsImageView.isUserInteractionEnabled = true
        shirtsImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func imageTapped1(_ gesture: UITapGestureRecognizer ) {
        print("Shirts Tapped")
    }
    
    func configShoesImageView() {
        shoesImageView.image = UIImage(named: "shoesIcon")
        shoesImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        shoesImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        shoesImageView.backgroundColor = .clear
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped2))
        shoesImageView.isUserInteractionEnabled = true
        shoesImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func imageTapped2(_ gesture: UITapGestureRecognizer ) {
        print("Shoes Tapped")
    }
    
    func configSocksImageView() {
        socksImageView.image = UIImage(named: "socksIcon")
        socksImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        socksImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        socksImageView.backgroundColor = .clear
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped3))
        socksImageView.isUserInteractionEnabled = true
        socksImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func imageTapped3(_ gesture: UITapGestureRecognizer ) {
        print("Socks Tapped")
    }
}


extension ShopListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        guard indexPath.item < imageArray.count else {
            return cell
        }
        
        let imageName = imageArray[indexPath.item].imageName
        cell.imageView.image = UIImage(named: imageName)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let secondViewController = ProductViewController()
        navigationController?.pushViewController(secondViewController, animated: true)
        
        print("Ячейка \(indexPath.item) выбрана")
        print(" \(indexPath.item + 1) ")
    }
}
