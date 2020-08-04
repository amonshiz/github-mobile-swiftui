//
//  Home.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/4/20.
//

import SwiftUI

struct Home: View {
  var body: some View {
    NavigationView {
      List {
        Section(
          header:
            Text("My Work")
        ) {
          ForEach(0..<5) { val in
            Text("\(val)")
          }
        }

        Section(
          header:
            HStack {
              Text("Favorites")
              Spacer()
              EditButton()
                .foregroundColor(.blue)
            }
        ) {
          ForEach(0..<5) { val in
            Text("\(val)")
          }
        }

        Section(
          header:
            Text("Recent")
        ) {
          ForEach(0..<5) { val in
            Text("\(val)")
          }
        }
      }
      .listStyle(InsetGroupedListStyle())
      .navigationTitle("Home")
      .toolbar(items: {
        ToolbarItem(placement: .destructiveAction) {
          Circle()
            .fill(Color.red)
            .frame(minWidth: 24, minHeight: 24)
        }
        ToolbarItem(placement: .confirmationAction) {
          Label {
            Text("Add")
          } icon: {
            Image(systemName: "plus.circle")
          }
          .foregroundColor(.blue)
        }
      })
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
