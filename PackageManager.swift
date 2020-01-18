//
//  PackageManager.swift
//  SwiftPackagesExplorer
//
//  Created by Vladimir Kukushkin on 6/16/19.
//  Copyright © 2019 kukushechkin. All rights reserved.
//

import SwiftUI
import Combine

let testPackage = Package(id: 0, name: "Some Package", author: "Some Author")

//// IMPORTANT: id should be unique
//var packagesData: [Package] = [
//    Package(id: 0, name: "Test Package", author: "Some Author"),
//    Package(id: 1, name: "Another Package", author: "Another Author"),
//    Package(id: 2, name: "Another Package", author: "Another Author"),
//    Package(id: 3, name: "Another Package", author: "Another Author"),
//    Package(id: 4, name: "Yet another Package", author: "Same Author")]

final class PackageManager: ObservableObject {    
    let didChange = PassthroughSubject<PackageManager, Never>()
    var packages: [Package] = []

    init() {
        let _ = load()
    }
    
    func load() -> [Package] {
        // TODO: pagination
        guard let url = URL(string: "https://api.github.com/search/repositories?q=PackageDescription+in:readme+language:swift&sort=stars&order=desc&&per_page=100") else {
            print("Failed to construct url")
            return []
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to get github data with error \(error)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Failed to parse response")
                return
            }
            
            print("Response: \(response)")
            if response.statusCode == 200 {
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(GitHubResponse.self, from: data)

                        // print("Decoded object: \(res)")
                        print("Total packages found: \(res.total_count)")
                        print("Packages on current page: \(res.items.count)")
                        self.packages = res.items
                        DispatchQueue.main.async() {
                            self.didChange.send(self)
                        }
                    }
                    catch {
                        print("error: \(error)")
                    }
                }
            }
            else {
                print("Reponse code is not 200")
            }
        }
        dataTask.resume()
        
        // TODO:
        return []
    }
}
