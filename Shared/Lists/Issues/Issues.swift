//
//  Issues.swift
//  github-mobile (iOS)
//
//  Created by Andrew Monshizadeh on 8/11/20.
//

import SwiftUI

struct Issues: View {
  var body: some View {
    List {
      ForEach(0..<5) { _ in
        IssueRow()
      }
    }
    .addSearchController()
    .navigationTitle("Issues")
    .navigationBarTitleDisplayMode(.inline)
    .toolbar(items: {
      ToolbarItem(placement: .navigationBarTrailing) {
        Image(systemName: "plus.circle")
      }
    })
  }
}

struct Issues_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Issues()
    }
  }
}
