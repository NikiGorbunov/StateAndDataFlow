//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Никита Горбунов on 14.04.2022.
//

import Combine

final class UserManager: ObservableObject {
    @Published var isRegistered = false
    var name = ""
}
