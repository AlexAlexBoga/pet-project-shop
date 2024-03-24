

import Foundation

@available(iOS 16.0, *)
class ProductRepository{
    
    private let productsJsonUrl: URL = try! FileManager.default.url(for: .allApplicationsDirectory, in: .allDomainsMask, appropriateFor: nil, create: true) .appending(path: "product.json")
    
    public func getProduclList() -> [Product] {
        do {
            let data = try Data(contentsOf: productsJsonUrl)
            let decoder = JSONDecoder()
            return try decoder.decode([Product].self, from: data)
        } catch  {
            print("Can not load from Json, error:\n\(error.localizedDescription)")
            return []
        }
    }
    
    public func addProduct(_ product: Product) {
        var products: [Product]
        do {
            let data = try Data(contentsOf: productsJsonUrl)
            let decoder = JSONDecoder()
            products = try decoder.decode([Product].self, from: data)
        } catch {
            print("Can't load products")
            products = []
        }
        
        products.append(product)
        
        do {
            let encoder = JSONEncoder()
            let newData = try encoder.encode(products)
            try newData.write(to: productsJsonUrl)
        } catch {
            print("Can not save Json, error:\n\(error.localizedDescription)")
        }
    }
    
    public func removeProduct(withId id: Product.ID) {
        do {
            let data = try Data(contentsOf: productsJsonUrl)
            let decoder = JSONDecoder()
            var products = try decoder.decode([Product].self, from: data)
            
            products.removeAll(where: { $0.id == id })
            
            let encoder = JSONEncoder()
            let newData = try encoder.encode(products)
            try newData.write(to: productsJsonUrl)
        } catch {
            print("Can not save Json, error:\n\(error.localizedDescription)")
        }
    }
}
