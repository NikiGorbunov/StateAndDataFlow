//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Никита Горбунов on 14.04.2022.
//

import Combine

final class UserManager: ObservableObject {
    @Published var user = User()
    
    var nameIsValid: Bool {
        user.name.count >= 2
    }
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
}
