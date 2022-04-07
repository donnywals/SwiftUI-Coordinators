//
//  ViewController.swift
//  SwiftUINav
//
//  Created by Donny Wals on 07/04/2022.
//

import SwiftUI
import Core

struct MainView: View {
    let coordinator: MainCoordinator
    @EnvironmentObject var userSession: UserSession
    
    var body: some View {
        VStack(spacing: 32) {
            HStack {
                Button("Open account") {
                    coordinator.launchAccountPage()
                }
                
                Spacer()
                
                Button("Help") {
                    coordinator.launchHelp()
                }
            }
            
            Spacer()
            
            HStack {
                Button("Settings") {
                    
                }
                
                Spacer()
                
                Button("Browser") {
                    
                }
            }
        }.padding()
    }
}
