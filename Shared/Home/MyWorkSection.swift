//
//  MyWorkSection.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/4/20.
//

import SwiftUI

struct MyWorkRow: View {
  let title: String
  let iconName: String
  let backgroundColor: Color

  var body: some View {
    Label {
      Text(title)
    } icon: {
      Image(systemName: iconName)
        .frame(width: 20, height: 20)
        .foregroundColor(.white)
        .padding(6)
        .background(
          RoundedRectangle(cornerRadius: 5)
            .fill(backgroundColor)
        )
    }
    .padding([.top, .bottom], 5)
  }
}

struct MyWorkSection: View {
  var body: some View {
    HomeListSection(header: "My Work") {
      MyWorkRow(title: "Issues", iconName: "exclamationmark.circle", backgroundColor: .green)

      MyWorkRow(title: "Pull Requests", iconName: "point.topleft.down.curvedto.point.bottomright.up", backgroundColor: .blue)

      MyWorkRow(title: "Repositories", iconName: "book.closed", backgroundColor: .purple)

      MyWorkRow(title: "Organizations", iconName: "person.2", backgroundColor: .orange)
    }
  }
}

struct MyWorkSection_Previews: PreviewProvider {
  static var previews: some View {
    List {
      MyWorkSection()
    }
    .listStyle(InsetGroupedListStyle())
  }
}
