//
//  Profile.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/4/20.
//

import SwiftUI

struct Pinned: View {
  var body: some View {
    VStack{
      Text("Pinned")
    }
  }
}

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
        .padding([.leading], -10)
        .background(Color.white)
      Section {
        Pinned()
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
