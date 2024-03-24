

import Foundation

struct User: Codable {
    var name: String
    var email: String?
    var password: String
    
    init(name: String, email: String? = nil, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}

