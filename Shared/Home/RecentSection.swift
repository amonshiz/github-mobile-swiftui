//
//  RecentSection.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/4/20.
//

import SwiftUI

struct RecentRow: View {
  var body: some View {
    HStack {
      VStack {
        Image(systemName: "exclamationmark.circle")
          .foregroundColor(.green)
          .padding([.top], 2)
        Spacer()
      }
      Spacer()
      VStack(alignment: .leading) {
        (Text("golang / go") + Text(" ") + Text("#38485"))
          .foregroundColor(Color(UIColor.darkGray))
          .font(.system(size: 15))
        Text("runtime: tracking bug for ARM-based macOS and GOOS/GOARCH values")
          .font(.system(size: 15))
          .fontWeight(.bold)
          .padding([.top], 4)
        Text("You commented")
          .padding([.top], 4)
          .foregroundColor(Color(UIColor.darkGray))
          .font(.system(size: 15))
      }
      .padding([.leading, .trailing], 5)

      Spacer()
      VStack(alignment: .trailing) {
        Text("12d")
          .foregroundColor(.gray)
          .padding([.bottom], 8)
        Text("31")
          .font(.system(size: 15))
          .padding([.leading, .trailing], 8)
          .padding([.top, .bottom], 2)
          .background(
            Color(UIColor.black.withAlphaComponent(0.10))
          )
          .clipShape(RoundedRectangle(cornerRadius: 3))
          .overlay(
            RoundedRectangle(cornerRadius: 3).stroke(Color(UIColor.black.withAlphaComponent(0.15)))
          )
        Spacer()
      }
    }
    .padding([.top, .bottom], 5)
    .padding([.leading, .trailing], -2)
  }
}

struct RecentSection: View {
  var body: some View {
    HomeListSection(header: "Recent") {
      HStack {
        RecentRow()
        NavigationLink(destination: Text("Destination")) {
          EmptyView()
        }
        .frame(width: 0)
        .opacity(0)
      }
    }
  }
}

struct RecentSection_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      List {
        RecentSection()
      }
      .listStyle(InsetGroupedListStyle())
    }
  }
}
