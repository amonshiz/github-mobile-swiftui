//
//  ExploreSection.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/10/20.
//

import SwiftUI

struct ExploreSection: View {
  let title: String
  var body: some View {
    Group {
      HStack {
        Text(title)
          .boldBlack()
          .padding([.leading])
          .font(.title3)
        Spacer()
      }
      .padding([.top])
      ScrollView(.horizontal, showsIndicators: false) {
        LazyHStack(spacing:15) {
          ForEach(0..<20) { _ in
            ExploreRepoCard(kind: .standard)
              .frame(idealWidth:350, minHeight: 500)
              .fixedSize(horizontal: true, vertical: false)
              .overlay(
                NavigationLink(destination: Repo()) { Color.clear }
              )
          }
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding([.bottom, .leading, .trailing])
      }
    }
  }
}

struct ExploreSection_Previews: PreviewProvider {
  static var previews: some View {
    ExploreSection(title: "Testing")
  }
}
