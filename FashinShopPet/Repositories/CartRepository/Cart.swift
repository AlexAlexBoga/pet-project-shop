//
//  Cart.swift
//  FashinShopPet
//
//  Created by Александр Богачев on 24.03.24.
//

import Foundation

struct Cart: Codable {
    var productIds: [Product.ID]
    
    init(products: [Product.ID] = []) {
        self.productIds = products
    }
}
