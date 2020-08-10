//
//  Explore.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/4/20.
//

import SwiftUI

struct Explore: View {
  var body: some View {
    NavigationView {
      ScrollView(.vertical) {
        VStack {
          ExploreRepoCard(kind: .featured)
            .padding()

          ExploreSection(title: "For you")
          ExploreSection(title: "Trending today")
        }
      }
      .background(
        Color(UIColor.systemGroupedBackground)
          .ignoresSafeArea()
      )
      .navigationTitle("Explore")
    }
    .navigationBarTitleDisplayMode(.large)
  }
}

struct Explore_Previews: PreviewProvider {
  static var previews: some View {
    Explore()
  }
}
