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
  }
}

struct ExploreRepoCard: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      Rectangle()
        .aspectRatio(2.0, contentMode: .fit)
        .frame(maxWidth: .infinity)
        .fixedSize(horizontal: false, vertical: true)

      Divider()

      VStack(alignment: .leading, spacing: 5) {
        Text("Featured Repository")
          .font(Font.caption.smallCaps())
          .padding([.top], 8)

        Text("Ciphey")
          .font(.title2)
          .boldBlack()
        Text("This is the song that never ends. Yes it goes on and on my friends. Some people started singing it, not knowing what it was. And they'll continue signing forever just  because")
          .fixedSize(horizontal: false, vertical: true)
          .truncationMode(.tail)
          .lineLimit(3)
          .font(.body)
        HStack {
          Label {
            Text("590")
              .font(.callout)
              .foregroundColor(Color(UIColor.darkGray))
          } icon: {
            Image(systemName: "star.fill")
              .foregroundColor(.yellow)
              .imageScale(.small)
          }

          Label {
            Text("Python")
              .font(.callout)
              .foregroundColor(Color(UIColor.darkGray))
          } icon: {
            Image(systemName:"circle.fill")
              .foregroundColor(Color(UIColor.systemTeal))
              .imageScale(.small)
          }
        }
        .padding([.bottom], 3)

        StarButton()
      }
      .padding([.leading, .trailing, .bottom])
    }
    .background(Color.white)
    .clipShape(RoundedRectangle(cornerRadius: 5.0))
    .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0.0, y: 2.0)
    .overlay(
      RoundedRectangle(cornerRadius: 5.0)
        .stroke(lineWidth: 1.0)
        .fill(Color(UIColor.lightGray))
    )
  }
}

struct ExploreRepoCard_Previews: PreviewProvider {
  static var previews: some View {
    ExploreRepoCard()
      .padding([.leading, .trailing, .top])
  }
}
