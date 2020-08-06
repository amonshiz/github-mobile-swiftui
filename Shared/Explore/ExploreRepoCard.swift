//
//  ExploreRepoCard.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/6/20.
//

import SwiftUI

struct StarButton: View {
  var body: some View {
    Button {
    } label: {
      Label {
        Text("Star")
      } icon: {
        Image(systemName: "star")
      }
      .padding()
      .foregroundColor(Color(UIColor.blue))
      .frame(maxWidth: .infinity)
    }
    .background(
      RoundedRectangle(cornerRadius: 5.0)
        .fill(Color.white)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0.0, y: 2.0)
    )
    .padding()
  }
}

struct ExploreRepoCard: View {
  var body: some View {
    VStack {
      Text("Hero Image")
      Text("Featured Repository")
        .font(Font.body.smallCaps())

      Text("Repo Name")
      Text("Repo Description")
      HStack {
        Label {
          Text("Stars")
        } icon: {
          Image(systemName: "star.fill")
            .foregroundColor(.yellow)
            .imageScale(.small)
        }

        Label {
          Text("Language")
        } icon: {
          Image(systemName:"circle.fill")
            .foregroundColor(Color(UIColor.systemTeal))
            .imageScale(.small)
        }
      }

      StarButton()
    }
  }
}

struct ExploreRepoCard_Previews: PreviewProvider {
  static var previews: some View {
    ExploreRepoCard()
  }
}
