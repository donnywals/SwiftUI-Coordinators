//
//  Coordinators.swift
//  SwiftUINav
//
//  Created by Donny Wals on 07/04/2022.
//

import UIKit
import SwiftUI
import Core
import AuthenticationModule
import PaywallModule

final class AppCoordinator {
    private let navigationController: UINavigationController
    private let userSession: UserSession
    
    init(navigationController: UINavigationController, userSession: UserSession) {
        self.navigationController = navigationController
        self.userSession = userSession
    }
    
    func launchMainView() {
        guard navigationController.viewControllers.isEmpty else {
            assertionFailure("Setting up main view in an app that appears to have already been set up. This is probably a mistake")
            return
        }

        let mainCoordinator = MainCoordinator(appCoordinator: self)
        let mainView = MainView(coordinator: mainCoordinator)
            .environmentObject(userSession)
        
        navigationController.viewControllers = [UIHostingController(rootView: mainView)]
    }
    
    func launchAuthenticationFlow(presentingViewController: UIViewController? = nil) {
        let authenticationCoordinator = AuthenticationCoordinator(
            userSession: userSession
        )
        
        authenticationCoordinator.launch(using: presentingViewController ?? navigationController)
    }
    
    func launchPaywallFlow(presentingViewController: UIViewController? = nil) {
        let paywallCoordinator = PaywallCoordinator(
            userSession: userSession
        )

        paywallCoordinator.launch(using: navigationController)
    }
}