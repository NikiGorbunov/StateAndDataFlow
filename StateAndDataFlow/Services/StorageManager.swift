//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Никита Горбунов on 25.04.2022.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "user"
    
    init() {}
    
    func save(user: User) {
        guard let userData = try? JSONEncoder().encode(user) else { return }
        userDefaults.set(userData, forKey: key)
    }
    
    func loadUser() -> User {
        guard let data = userDefaults.object(forKey: key) as? Data else { return User() }
        guard let user = try? JSONDecoder().decode(User.self, from: data) else { return User() }
        return user
    }
    
    func clear(userManager: UserManager) {
        userManager.user.isRegistered = false
        userManager.user.name = ""
        userDefaults.removeObject(forKey: key)
    }
}
