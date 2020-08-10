//
//  Home.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/4/20.
//

import SwiftUI

struct EditButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
//      .padding([.trailing], -20)
//      .textCase(.none)
//      .font(.subheadline)
//      .foregroundColor(.blue)
  }
}

struct Home: View {
  func listStyle() -> some ListStyle {
    #if os(macOS)
    return SidebarListStyle()
    #else
    return InsetGroupedListStyle()
    #endif
  }
  var body: some View {
    applyTitleDisplayMode(
      content:
        NavigationView {
          HomeList()
            .listStyle(listStyle())
            .navigationTitle("Home")
            .toolbar(items: {
              ToolbarItem(placement: .destructiveAction) {
                NavigationLink(destination: Profile()) {
                  Circle()
                    .fill(Color.red)
                    .frame(minWidth: 24, minHeight: 24)
                }
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
        })
  }

  func applyTitleDisplayMode<Content: View>(content: Content) -> some View {
    #if !os(macOS)
    return content.navigationBarTitleDisplayMode(.inline)
    #else
    return content
    #endif
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
