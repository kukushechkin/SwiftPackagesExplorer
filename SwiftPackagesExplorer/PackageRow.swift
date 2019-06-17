//
//  PackageRow.swift
//  SwiftPackagesExplorer
//
//  Created by Vladimir Kukushkin on 6/16/19.
//  Copyright © 2019 kukushechkin. All rights reserved.
//

import SwiftUI

struct PackageRow : View {
    let package: Package
    
    var body: some View {
        HStack {
            Text(package.name)
                .font(.title)
            Spacer()
            Text(package.owner.login)
                .font(.subheadline)
        }
    }
}

#if DEBUG
struct PackageRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            PackageRow(package: Package(id: 0, name: "TestPackage", author: "Some Author"))
            PackageRow(package: Package(id: 2, name: "TestPackage", author: "Some Author"))
            PackageRow(package: Package(id: 3, name: "TestPackage", author: "Some Author"))
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
