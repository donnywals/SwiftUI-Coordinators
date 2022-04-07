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
    private let userSession: UserSession
    private let rootViewController: UIViewController
    
    init(rootViewController: UIViewController, userSession: UserSession) {
        self.userSession = userSession
        self.rootViewController = rootViewController
    }
    
    func launchMainView() {
        let mainCoordinator = MainCoordinator(rootViewController: rootViewController, userSession: userSession)
        let mainView = MainView(coordinator: mainCoordinator)
            .environmentObject(userSession)
        let mainController = UIHostingController(rootView: mainView)
        
        mainController.willMove(toParent: rootViewController)
        rootViewController.addChild(mainController)
        mainController.didMove(toParent: rootViewController)
        
        rootViewController.view.addSubview(mainController.view)
        mainController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainController.view.topAnchor.constraint(equalTo: rootViewController.view.topAnchor),
            mainController.view.leftAnchor.constraint(equalTo: rootViewController.view.leftAnchor),
            mainController.view.rightAnchor.constraint(equalTo: rootViewController.view.rightAnchor),
            mainController.view.bottomAnchor.constraint(equalTo: rootViewController.view.bottomAnchor)
        ])
    }
}
