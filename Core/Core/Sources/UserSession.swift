//
//  UserSession.swift
//  SwiftUINav
//
//  Created by Donny Wals on 07/04/2022.
//

import Foundation

public struct User {
    public let id = UUID()
    public var isPro = false
    
    public init() {}
}

public final class UserSession: ObservableObject {
    @Published public var currentUser: User?
    
    public init() {
        currentUser = nil
    }
    
    public func authenticate(_ username: String, password: String) async throws -> User {
        let user = User()
        currentUser = user
        return user
    }
    
    public func register(_ username: String, password: String) async throws -> User {
        let user = User()
        currentUser = user
        return user
    }
    
    public func logout() async throws {
        currentUser = nil
    }
    
    public func getUpgrade() async throws {
        currentUser?.isPro = true
    }
}
