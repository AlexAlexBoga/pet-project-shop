

import Foundation

@available(iOS 16.0, *)
class UserRepository{
    private let userFileName = "user.json"
    
    public func getUser() -> User? {
        do {
            let url = try getUrl(fileName: userFileName)
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(User.self, from: data)
        } catch {
            print("Can not load user from json-file")
            return nil
        }
    }
    
    public func setUser(_ user: User) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(user)
            let url = try getUrl(fileName: userFileName)
            try data.write(to: url)
        } catch {
            print("Can not save user to json-file")
        }
    }
    
    public func deleteUser() {
        try? FileManager.default.removeItem(at: getUrl(fileName: userFileName))
    }
    
    private func getUrl(fileName: String) throws -> URL {
        try FileManager.default.url(for: .applicationSupportDirectory, in: .allDomainsMask, appropriateFor: nil, create: true) .appending(path: fileName)
    }
}
