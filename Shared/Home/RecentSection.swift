//
//  RecentSection.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/4/20.
//

import SwiftUI

struct RecentSection: View {
  var body: some View {
    HomeListSection(header: "Recent") {
      HStack {
        IssueRow()
        NavigationLink(destination: Text("Destination")) {
          EmptyView()
        }
        .frame(width: 0)
        .opacity(0)
      }
    }
  }
}

struct RecentSection_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      List {
        RecentSection()
      }
      .listStyle(InsetGroupedListStyle())
    }
  }
}
