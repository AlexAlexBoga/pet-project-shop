//
//  ProductViewController.swift
//  FashinShopPet
//
//  Created by Александр Богачев on 10.02.24.
//

import UIKit

class ProductViewController: UIViewController {
    
    let productImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProductImage()
    }
    
    func setupProductImage() {
        view.addSubview(productImage)
        
        NSLayoutConstraint.activate([
            productImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productImage.topAnchor.constraint(equalTo: view.topAnchor),
            productImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        updateImage()
    }
    
    func updateImage() {
        let newImage = UIImage(named: "image1")
        productImage.image = newImage
    }
    
}
