//
//  PackageList.swift
//  SwiftPackagesExplorer
//
//  Created by Vladimir Kukushkin on 6/16/19.
//  Copyright © 2019 kukushechkin. All rights reserved.
//

import SwiftUI
import Combine

struct PackageList : View {
    @ObservedObject
    var packageManager = PackageManager()

    var body: some View {
        NavigationView {
            
            List(packageManager.packages.filter {
                let _ = $0.name
                return true
                // TODO: search field, check corresponding session
                // $0.name.contains("swift")
            }) { package in
                NavigationLink(destination: PackageDetail(package: package)) {
                    PackageRow(package: package)
                }
                .navigationBarTitle(Text("Packages (\(self.packageManager.packages.count))"), displayMode: .large)
            }
        }
    }
}

#if DEBUG
struct PackageList_Previews : PreviewProvider {
    static var previews: some View {
        PackageList()
    }
}
#endif
