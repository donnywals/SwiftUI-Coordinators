//
//  PayWallCoordinator.swift
//  SwiftUINav
//
//  Created by Donny Wals on 07/04/2022.
//

import SwiftUI
import UIKit
import Core
import AuthenticationModule

public final class PaywallCoordinator {
    private let flowNavigationController: UINavigationController
    private let userSession: UserSession
    
    public init(flowNavigationController: UINavigationController = UINavigationController(),
                userSession: UserSession) {
        self.flowNavigationController = flowNavigationController
        self.userSession = userSession
    }
    
    public func launch(using presentingViewController: UIViewController) {
        let paywallView = PaywallView(coordinator: self)
            .environmentObject(userSession)
        
        flowNavigationController.viewControllers = [UIHostingController(rootView: paywallView)]
        flowNavigationController.modalPresentationStyle = .fullScreen
        
        if userSession.currentUser == nil {
            let authenticationCoordinator = AuthenticationCoordinator(
                userSession: userSession
            )
            authenticationCoordinator.onAuthenticationDismissed = { [weak self] in
                guard let self = self else { return }
                
                if self.userSession.currentUser != nil {
                    presentingViewController.present(self.flowNavigationController,
                                                     animated: true)
                }
            }
            authenticationCoordinator.launch(using: presentingViewController)
        } else {
            presentingViewController.present(flowNavigationController,
                                             animated: true)
        }
    }
    
    func onPurchaseCompleted() {
        flowNavigationController.dismiss(animated: true)
    }
    
    func onPurchaseCancelled() {
        flowNavigationController.dismiss(animated: true)
    }
}
