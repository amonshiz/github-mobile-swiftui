//
//  FavoritesSection.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/4/20.
//

import SwiftUI

struct FavoritesRow: View {
  let imageName: String
  let repoName: String

  var body: some View {
    IconRow(style: .base(title: repoName, iconName: imageName, backgroundColor: .yellow))
  }
}

struct FavoritesSection: View {
  var body: some View {
    HomeListSection {
      HStack(alignment: .center) {
        Text("Favorites")
        Spacer()
        Button{
        } label: {
          Text("Edit")
        }
        .modifier(EditButtonModifier())
      }
    } content: {
      FavoritesRow(imageName: "person.crop.circle", repoName: "amonshiz/ListSectionIndex")
      FavoritesRow(imageName: "person.crop.circle", repoName: "amonshiz/NavigationTitle")
      FavoritesRow(imageName: "person.crop.circle", repoName: "amonshiz/feedback-examples")
      FavoritesRow(imageName: "person.crop.circle", repoName: "amonshiz/phone-sample")
    }
  }
}

struct FavoritesSection_Previews: PreviewProvider {
  static var previews: some View {
    #if !os(macOS)
    NavigationView {
      List {
        FavoritesSection()
      }
      .listStyle(InsetGroupedListStyle())
    }
    #else
    NavigationView {
      List {
        FavoritesSection()
      }
      .listStyle(InsetListStyle())
    }
    #endif
  }
}
