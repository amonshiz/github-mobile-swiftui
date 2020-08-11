//
//  Watchers.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/11/20.
//

import SwiftUI

struct Watcher {
  let displayName: String
  let userName: String
  let description: String?
}

extension Watcher: Identifiable {
  var id: String { userName }
}

let watchers = [
  Watcher(displayName: "blue", userName: "wyxy2005", description: "love coding, day by day programming"),
  Watcher(displayName: "Jian LinShan", userName: "jlstmac", description: nil),
  Watcher(displayName: "chenwenbin", userName: "Supecomer", description: "ios, nodeJS, cocos2d-js, html, beego"),
  Watcher(displayName: "FARIDKH", userName: "FARIDKH", description: "Dummy coder : trying to learn development for 3 years")
]

struct Watchers: View {
  var body: some View {
    List(watchers) { w in
      HStack {
        WatcherRow(watcher: w)
        NavigationLink(
          destination: Profile(),
          label: {
            EmptyView()
          })
          .frame(width: 0, height: 0)
      }
    }
    .navigationTitle("Watchers")
  }
}

struct Watchers_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Watchers()
    }
  }
}
