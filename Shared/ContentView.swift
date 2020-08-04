//
//  ContentView.swift
//  Shared
//
//  Created by Andrew Monshizadeh on 8/4/20.
//

import SwiftUI

struct ContentView: View {
  @State var selectedTab: String = "Home"
  var body: some View {
    TabView(selection: $selectedTab) {
      Home()
        .tabItem {
          Text("Home")
          Image(systemName: selectedTab == "Home" ? "house.fill" : "house")
        }
        .tag("Home")
      Notifications()
        .tabItem {
          Text("Notifications")
          Image(systemName: selectedTab == "Notifications" ? "bell.fill" : "bell")
        }
        .tag("Notifications")
      Explore()
        .tabItem {
          Text("Explore")
          Image(systemName: "magnifyingglass")
        }
        .tag("Explore")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
