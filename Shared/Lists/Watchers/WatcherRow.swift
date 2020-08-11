//
//  WatcherRow.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/11/20.
//

import SwiftUI

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

struct WatcherRow_Previews: PreviewProvider {
  static var previews: some View {
    WatcherRow(watcher: watchers[0])
  }
}
