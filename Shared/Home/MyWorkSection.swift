//
//  MyWorkSection.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/4/20.
//

import SwiftUI

struct MyWorkSection: View {
  var body: some View {
    HomeListSection(header: "My Work") {
      IconRow(destination: Issues(), style: .base(title: "Issues", iconName: "exclamationmark.circle", backgroundColor: .green))

      IconRow(destination: Text("Pull Requests"), style: .base(title: "Pull Requests", iconName: "point.topleft.down.curvedto.point.bottomright.up", backgroundColor: .blue))

      IconRow(destination: Text("Repositories"), style: .base(title: "Repositories", iconName: "book.closed", backgroundColor: .purple))

      IconRow(destination: Text("Organizations"), style: .base(title: "Organizations", iconName: "person.2", backgroundColor: .orange))
    }
  }
}

struct MyWorkSection_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      List {
        MyWorkSection()
      }
      .listStyle(InsetGroupedListStyle())
    }
  }
}
