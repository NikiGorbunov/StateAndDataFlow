//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Никита Горбунов on 14.04.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            TextField("Enter your name...", text: $userManager.user.name)
                .multilineTextAlignment(.center)
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!userManager.nameIsValid)
        }
    }
    
    private func registerUser() {
        if !userManager.user.name.isEmpty {
            userManager.user.isRegistered.toggle()
            StorageManager.shared.save(user: userManager.user)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}
