//
//  RegisterUserRequest.swift
//  Gym Application
//
//  Created by Piumi Wijenayake on 2023-05-13.
//

import Foundation

struct RegisterUserRequest{
    let username: String
    let email: String
    let phone: Int
    let password: String
    let confirmPassword: String
}
