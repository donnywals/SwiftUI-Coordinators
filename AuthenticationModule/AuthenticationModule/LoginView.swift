//
//  LoginView.swift
//  SwiftUINav
//
//  Created by Donny Wals on 07/04/2022.
//

import Foundation
import SwiftUI
import Core

private final class AuthenticationViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
}

public struct AuthenticationView: View {
    private let coordinator: AuthenticationCoordinator
    @StateObject private var viewModel = AuthenticationViewModel()
    @EnvironmentObject private var userSession: UserSession
    
    public init(coordinator: AuthenticationCoordinator) {
        self.coordinator = coordinator
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            TextField("username", text: $viewModel.username)
            TextField("password", text: $viewModel.password)
            Button("Log in") {
                Task {
                    do {
                        let _ = try await userSession.authenticate(viewModel.username, password: viewModel.password)
                        coordinator.onAuthenticationComplete()
                    } catch {
                        print(error)
                    }
                }
            }
            
            Button("Register") {
                coordinator.presentSignupView()
            }
        }
    }
}
