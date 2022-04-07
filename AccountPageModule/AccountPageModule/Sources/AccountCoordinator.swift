//
//  AccountCoordinator.swift
//  AccountPageModule
//
//  Created by Donny Wals on 07/04/2022.
//

import Core
import UIKit
import AuthenticationModule
import PaywallModule
import SwiftUI

public final class AccountCoordinator {
    private let userSession: UserSession
    private let navigationController: UINavigationController
    
    public init(navigationController: UINavigationController = UINavigationController(),
         userSession: UserSession) {
        
        self.userSession = userSession
        self.navigationController = navigationController
    }
    
    public func buildAccountView() -> UIViewController {
        let accountView = AccountView(coordinator: self)
            .environmentObject(userSession)
        
        return UIHostingController(rootView: accountView)
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
