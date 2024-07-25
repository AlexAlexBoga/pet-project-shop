//
//  User+isEmpty.swift
//  FashinShopPet
//
//  Created by Александр Богачев on 6.04.24.
//

import Foundation



extension User {
    var isEmpty: Bool {
        name.isEmpty || password.isEmpty
    }
}

extension Optional where Wrapped == User {
    var isEmpty: Bool {
        self?.isEmpty ?? true
    }
}
