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

struct WatcherRow: View {
  let watcher: Watcher

  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      HStack(alignment: .center, spacing:8) {
        RoundedRectangle(cornerRadius: 5)
          .fill(Color.red)
          .frame(width: 48, height: 48)
        VStack(alignment: .leading) {
          Text(watcher.displayName)
            .font(.headline)
            .boldBlack()
          Text(watcher.userName)
            .font(.body)
            .foregroundColor(Color(UIColor.darkGray))
        }
        Spacer()
      }
//      .alignmentGuide(.leading) { $0[.leading] + 48 + 8 }
      if let desc = watcher.description {
        Text(desc)
          .lineLimit(3)
          .padding([.leading], 56)
      }
    }
  }
}


struct Watchers: View {
  var body: some View {
    List(watchers) { w in
      WatcherRow(watcher: w)
    }
  }
}

struct Watchers_Previews: PreviewProvider {
  static var previews: some View {
    Watchers()
  }
}
