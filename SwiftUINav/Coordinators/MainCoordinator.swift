//
//  MainCoordinator.swift
//  SwiftUINav
//
//  Created by Donny Wals on 07/04/2022.
//

import SwiftUI
import UIKit

final class MainCoordinator {
    private let appCoordinator: AppCoordinator
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }

    func onAuthenticateTapped() {
        appCoordinator.launchAuthenticationFlow()
    }
    
    func launchPaywall() {
        appCoordinator.launchPaywallFlow()
    }
}

