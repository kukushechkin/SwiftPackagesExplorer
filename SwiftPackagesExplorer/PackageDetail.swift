
//
//  PackageDetail.swift
//  SwiftPackagesExplorer
//
//  Created by Vladimir Kukushkin on 6/16/19.
//  Copyright © 2019 kukushechkin. All rights reserved.
//

import SwiftUI

struct PackageDetail : View {
    let package: Package
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(package.full_name)
                .font(.title)
                HStack {
                    // TODO: unable to fetch image
                    // Image(package.owner.avatar_url)
                    // Divider()
                    Text(package.owner.login)
                        .color(.gray)
                        .font(.subheadline)
                }
            Button(action: {
                if let packageUrl = URL(string: self.package.url) {
                    UIApplication.shared.open(packageUrl)
                }
            }) {
                Text("Show on GitHub")
                    .font(.subheadline)
            }
            Divider()
            
            Text(self.package.description ?? "")
                .lineLimit(nil)
                .font(.subheadline)
                .padding(.top, 50)
            Spacer()
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

#if DEBUG
struct PackageDetail_Previews : PreviewProvider {
    static var previews: some View {
        PackageDetail(package: testPackage)
    }
}
#endif
