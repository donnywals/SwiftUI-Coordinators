//
//  ViewController.swift
//  SwiftUINav
//
//  Created by Donny Wals on 07/04/2022.
//

import SwiftUI
import Core

struct MainView: View {
    let coordinator: MainCoordinator
    @EnvironmentObject var userSession: UserSession
    
    var body: some View {
        VStack(spacing: 64) {
            Button("Use paid feature") {
                if userSession.currentUser?.isPro == true {
                    print("good!")
                } else {
                    coordinator.launchPaywall()
                }
            }
            
            if let user = userSession.currentUser {
                VStack(spacing: 32) {
                    Text("Logged in as \(user.id.uuidString)")
                    Button("sign out") {
                        Task {
                            do {
                                try await userSession.logout()
                            } catch {
                                print("failed to log out")
                            }
                        }
                    }
                }
            } else {
                VStack {
                    Text("You need to sign in")
                    Button("sign in") {
                        coordinator.onAuthenticateTapped()
                    }
                }
            }
        }
    }
}
