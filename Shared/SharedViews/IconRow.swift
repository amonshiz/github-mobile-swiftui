//
//  IconRow.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/4/20.
//

import SwiftUI

struct IconRow: View {
  enum Style {
    case base(title: String, iconName: String, backgroundColor: Color)
    case count(title: String, count: Int, iconName: String, backgroundColor: Color)
  }

  let style: Style

  private func view(title: String, count: Int?, iconName: String, backgroundColor: Color) -> some View {
    NavigationLink(
      destination: Text(title),
      label: {
        HStack {
          Label {
            Text(title)
          } icon: {
            Image(systemName: iconName)
              .frame(width: 20, height: 20)
              .foregroundColor(.white)
              .padding(6)
              .background(
                RoundedRectangle(cornerRadius: 5)
                  .fill(backgroundColor)
              )
          }
          if let count = count {
            Spacer()
            Text("\(count)")
              .font(.callout)
              .foregroundColor(.gray)
          }
        }
      })
      .modifier(HomeListRowModifier())

  }

  var body: some View {
    switch style {
      case let .base(title: title, iconName: iconName, backgroundColor: backgroundColor):
        return view(title: title, count: nil, iconName: iconName, backgroundColor: backgroundColor)
      case let .count(title: title, count: count, iconName: iconName, backgroundColor: backgroundColor):
        return view(title: title, count: count, iconName: iconName, backgroundColor: backgroundColor)
    }
  }
}

struct IconRow_Previews: PreviewProvider {
  static var previews: some View {
    EmptyView()
    //        IconRow()
  }
}
