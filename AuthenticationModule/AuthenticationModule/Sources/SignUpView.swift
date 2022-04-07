//
//  SignUpView.swift
//  SwiftUINav
//
//  Created by Donny Wals on 07/04/2022.
//

import SwiftUI
import Core

private final class SignupViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
}

struct SignupView: View {
    private let coordinator: AuthenticationCoordinator
    @StateObject private var viewModel = SignupViewModel()
    @EnvironmentObject private var userSession: UserSession
    
    init(coordinator: AuthenticationCoordinator) {
        self.coordinator = coordinator
    }
    
    var body: some View {
        TextField("username", text: $viewModel.username)
        TextField("password", text: $viewModel.password)
        Button("Sign up") {
            Task {
                do {
                    let _ = try await userSession.authenticate(viewModel.username, password: viewModel.password)
                    coordinator.onAuthenticationComplete()
                } catch {
                    print(error)
                }
            }
        }
        
        Button("Log in") {
            coordinator.presentLoginView()
        }
    }
}
