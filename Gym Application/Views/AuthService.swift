//
//  AuthService.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-13.
//

import Foundation
class AuthService{
    public static let shared = AuthService()
    public init() {}
    
    public func registerUser(with userRequest: RegisterUserRequest, completion: @escaping (Bool, Error?)->Void) {
        
    }
}
