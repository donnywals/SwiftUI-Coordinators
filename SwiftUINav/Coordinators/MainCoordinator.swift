//
//  MainCoordinator.swift
//  SwiftUINav
//
//  Created by Donny Wals on 07/04/2022.
//

import SwiftUI
import UIKit
import AccountPageModule
import AuthenticationModule
import Core

final class MainCoordinator {
    private let userSession: UserSession
    private let rootViewController: UIViewController
    
    init(rootViewController: UIViewController, userSession: UserSession) {
        self.userSession = userSession
        self.rootViewController = rootViewController
    }
    
    func launchHelp() {
        UIApplication.shared.open(URL(string: "https://donnywals.com")!)
    }
    
    func launchAccountPage() {
        let accountCoordinator = AccountCoordinator(rootViewController: rootViewController, userSession: userSession)
        let accountPage = accountCoordinator.buildAccountView()
        accountPage.modalTransitionStyle = .crossDissolve
        accountPage.modalPresentationStyle = .fullScreen
        
        rootViewController.present(accountPage, animated: true)
    }
}

