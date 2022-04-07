//
//  MainCoordinator.swift
//  SwiftUINav
//
//  Created by Donny Wals on 07/04/2022.
//

import SwiftUI
import UIKit
import AccountPageModule
import Core

final class MainCoordinator {
    private let userSession: UserSession
    private let navigationController: UINavigationController
    
    init(userSession: UserSession, navigationController: UINavigationController) {
        self.userSession = userSession
        self.navigationController = navigationController
    }
    
    func launchHelp() {
        UIApplication.shared.open(URL(string: "https://donnywals.com")!)
    }
    
    func launchAccountPage() {
        let accountCoordinator = AccountCoordinator(navigationController: navigationController, userSession: userSession)
        let accountPage = accountCoordinator.buildAccountView()
        navigationController.pushViewController(accountPage, animated: true)
    }
}

