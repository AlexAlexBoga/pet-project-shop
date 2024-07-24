//
//  CartRepository.swift
//  FashinShopPet
//
//  Created by Александр Богачев on 24.03.24.
//

import Foundation



class CartRepository {
    private let jsonUrl = try! FileManager.default.url(for: .applicationSupportDirectory, in: .allDomainsMask, appropriateFor: nil, create: true) .appending(path: "cart.json")
    
    func getCartContents() -> Cart? {
        do {
            let data = try Data(contentsOf: jsonUrl)
            let decoder = JSONDecoder()
            return try decoder.decode(Cart.self, from: data)
        } catch {
            print("Error to load cart from JSON:\n\(error.localizedDescription)")
            return nil
        }
    }
    
    func addProduct(id: Product.ID) {
        var cart = getCartContents() ?? Cart()
        cart.productIds.append(id)
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(cart)
            try data.write(to: jsonUrl)
        } catch {
            print("Error to save cart to JSON:\n\(error.localizedDescription)")
        }
    }
    
    func deleteProduct(withId id: Product.ID) {
        guard var cart = getCartContents() else { return }
        cart.productIds.removeAll(where: { $0 == id })
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(cart)
            try data.write(to: jsonUrl)
        } catch {
            print("Error to save cart to JSON:\n\(error.localizedDescription)")
        }
    }
}
