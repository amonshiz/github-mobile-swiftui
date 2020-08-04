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
    NavigationLink(
      destination: Text(repoName),
      label: {
        Label {
          Text(repoName)
        } icon: {
          Image(systemName: imageName)
            .frame(width: 20, height: 20)
            .padding(6)
            .background(
              RoundedRectangle(cornerRadius: 5)
                .fill(Color.yellow)
            )
        }
      })
      .modifier(HomeListRowModifier())
  }
}

struct FavoritesSection: View {
  var body: some View {
    HomeListSection {
      HStack(alignment: .bottom) {
        Text("Favorites")
        Spacer()
        EditButton()
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
    NavigationView {
      List {
        FavoritesSection()
      }
      .listStyle(InsetGroupedListStyle())
    }
  }
}
