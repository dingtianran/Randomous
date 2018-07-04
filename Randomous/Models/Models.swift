//
//  Models.swift
//  Randomous
//
//  Created by Tianran Ding on 4/07/18.
//  Copyright © 2018 TDing. All rights reserved.
//

import Foundation

struct RandomResult: Codable {
    let results: [User]
}

struct User: Codable {
    let gender: String
    let email: String
    let phone: String?
    let cell: String?
    let name: Name
    let picture: Picture
}

struct Picture: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}

struct Name: Codable {
    let title: String
    let first: String
    let last: String
}
