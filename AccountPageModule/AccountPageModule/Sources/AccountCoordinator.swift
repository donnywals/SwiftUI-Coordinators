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
    private let rootViewController: UIViewController
    
    public init(rootViewController: UIViewController,
         userSession: UserSession) {
        
        self.userSession = userSession
        self.rootViewController = rootViewController
    }
    
    public func buildAccountView() -> UIViewController {
        let accountView = AccountView(coordinator: self)
            .environmentObject(userSession)
        
        return UIHostingController(rootView: accountView)
    }
    
    func launchAuthenticationFlow() {
        let authenticationCoordinator = AuthenticationCoordinator(
            userSession: userSession
        )
        
        authenticationCoordinator.launch(using: rootViewController.presentedViewController ?? rootViewController)
    }
    
    func launchPaywallFlow() {
        let paywallCoordinator = PaywallCoordinator(
            userSession: userSession
        )
        
        paywallCoordinator.launch(using: rootViewController.presentedViewController ?? rootViewController)
    }
}
