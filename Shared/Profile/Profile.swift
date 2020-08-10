//
//  Profile.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/4/20.
//

import SwiftUI

struct Links: View {
  var body: some View {
    Group {
      IconRow(style: .count(title: "Repositories", count: 30, iconName: "book.closed", backgroundColor: .purple))
      IconRow(style: .count(title: "Starred", count: 47, iconName: "star", backgroundColor: .yellow))
      IconRow(style: .count(title: "Organizations", count: 2, iconName: "person.2", backgroundColor: .orange))
    }
  }
}

struct Profile: View {

  func listStyle() -> some ListStyle {
    #if os(macOS)
    return SidebarListStyle()
    #else
    return GroupedListStyle()
    #endif
  }

  var body: some View {
    applyTitleDisplayMode(
      content:
        List {
          ProfileInfoSection()
            .padding([.top, .bottom])
            .padding([.leading], -10)
            .background(Color.white)
          Section{
            PinnedSection()
              .padding([.top, .bottom])

            Links()
          }
        })
      .listStyle(listStyle())
  }

  func applyTitleDisplayMode<Content: View>(content: Content) -> some View {
    #if !os(macOS)
    return content.navigationBarTitleDisplayMode(.inline)
    #else
    return content
    #endif
  }
}

struct Profile_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Profile()
    }
  }
}
