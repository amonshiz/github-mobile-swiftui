//
//  HomeList.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/4/20.
//

import SwiftUI

struct HomeListRowModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding([.top, .bottom], 5)
  }
}

struct HomeList: View {
  var body: some View {
    List {
      MyWorkSection()

      FavoritesSection()

      HomeListSection(header: "Recent") {
        ForEach(0..<5) { val in
          Text("\(val)")
        }
      }
    }
  }
}

struct HomeList_Previews: PreviewProvider {
  static var previews: some View {
    HomeList()
  }
}
