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
  var body: some View {
    List {
      ProfileInfoSection()
        .padding([.top, .bottom])
        .background(Color.white)
      Section{
        PinnedSection()
          .padding([.top, .bottom])

        Links()
      }
    }
    .listStyle(GroupedListStyle())
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct Profile_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Profile()
    }
  }
}
