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
          ExploreRepoCard()
            .padding([.leading, .trailing, .top])

          Text("For You")
          ScrollView(.horizontal) {
            LazyHStack {
              ForEach(0..<20) { _ in
                Text("For You")
              }
            }
          }

          Text("Treanding today")
          ScrollView(.horizontal) {
            LazyHStack {
              ForEach(0..<20) { _ in
                Text("Trending")
              }
            }
          }
        }
      }
      .background(Color(UIColor.systemGroupedBackground))
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
