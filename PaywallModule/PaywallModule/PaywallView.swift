//
//  PaywallView.swift
//  SwiftUINav
//
//  Created by Donny Wals on 07/04/2022.
//

import SwiftUI
import Core

public struct PaywallView: View {
    let coordinator: PaywallCoordinator
    @EnvironmentObject var userSession: UserSession
    
    public init(coordinator: PaywallCoordinator) {
        self.coordinator = coordinator
    }
    
    public var body: some View {
        VStack(spacing: 16) {
            Button("Get paid feature") {
                Task {
                    try await userSession.getUpgrade()
                    coordinator.onPurchaseCompleted()
                }
            }
            
            Button("No thanks") {
                coordinator.onPurchaseCancelled()
            }
        }
    }
}
