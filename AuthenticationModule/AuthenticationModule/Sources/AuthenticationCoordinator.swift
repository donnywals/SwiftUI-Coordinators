//
//  AuthenticationCoordinator.swift
//  SwiftUINav
//
//  Created by Donny Wals on 07/04/2022.
//

import SwiftUI
import UIKit
import Core

public final class AuthenticationCoordinator {
    private let flowNavigationController: UINavigationController
    private let userSession: UserSession
    
    public var onAuthenticationDismissed: () -> Void = { }
    
    public init(flowNavigationController: UINavigationController = UINavigationController(),
                userSession: UserSession) {
        self.flowNavigationController = flowNavigationController
        self.userSession = userSession
    }
    
    public func launch(using presentingViewController: UIViewController) {
        let authenticationView = AuthenticationView(coordinator: self)
            .environmentObject(userSession)

        flowNavigationController.viewControllers = [
            UIHostingController(rootView: authenticationView)
        ]
        flowNavigationController.modalPresentationStyle = .fullScreen
        
        presentingViewController.present(
            flowNavigationController,
            animated: true
        )
    }
    
    func presentLoginView() {
        flowNavigationController.popToRootViewController(animated: true)
    }
    
    func presentSignupView() {
        let signupView = SignupView(coordinator: self)
            .environmentObject(userSession)
        
        flowNavigationController.pushViewController(
            UIHostingController(rootView: signupView),
            animated: true
        )
    }
    
    func onAuthenticationComplete() {
        flowNavigationController.dismiss(animated: true, completion: onAuthenticationDismissed)
    }
}
