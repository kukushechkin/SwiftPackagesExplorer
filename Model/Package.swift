//
//  Package.swift
//  SwiftPackagesExplorer
//
//  Created by Vladimir Kukushkin on 6/16/19.
//  Copyright © 2019 kukushechkin. All rights reserved.
//

import SwiftUI
import Foundation

struct Owner: Codable {
    let login: String
    let avatar_url: String
    
    init(login: String, avatar_url: String) {
        self.login = login
        self.avatar_url = avatar_url
    }
}

struct Package: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String?
    let full_name: String
    let url: String
    let owner: Owner
    
    init(id: Int, name: String, author: String) {
        self.id = id
        self.name = name
        self.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse est leo, vehicula eu eleifend non, auctor ut arcu"
        self.full_name = name
        self.url = "http://apple.com" // TODO:
        self.owner = Owner(login: author, avatar_url: "")
    }
}

struct GitHubResponse: Codable {
    let total_count: Int
    let incomplete_results: Bool
    let items: [Package]
    
}
