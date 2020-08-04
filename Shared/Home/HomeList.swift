//
//  HomeList.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/4/20.
//

import SwiftUI

struct HomeList: View {
  var body: some View {
    List {
      MyWorkSection()

      HomeListSection {
        HStack(alignment: .bottom) {
          Text("Favorites")
          Spacer()
          EditButton()
            .modifier(EditButtonModifier())
        }
      } content: {
        ForEach(0..<5) { val in
          Text("\(val)")
        }
      }

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
