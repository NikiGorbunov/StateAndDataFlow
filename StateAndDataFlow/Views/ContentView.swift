//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Никита Горбунов on 14.04.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.top, 200)
            Spacer()
            ButtonView(title: "\(timer.buttonTitle)", color: .red) {
                timer.startTimer()
            }
            Spacer()
            ButtonView(title: "LOG OUT", color: .blue) {
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}


