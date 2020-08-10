//
//  RepoInfoHeader.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/10/20.
//

import SwiftUI

private struct InfoHeaderButton: View {
  enum Status {
    case active(iconColor: Color)
    case inactive
  }

  let title: String
  let iconName: String
  let status: Status
  let action: () -> ()

  private func styledButton(status: Status) -> some View {
    let iconColor: Color
    let textColor: Color
    switch status {
      case let .active(iconColor: ic):
        iconColor = ic
        textColor = .gray
      case .inactive:
        iconColor = .blue
        textColor = .blue
    }

    return HStack(alignment: .center, spacing: 5) {
      Image(systemName: iconName)
        .foregroundColor(iconColor)
      Text(title)
        .foregroundColor(textColor)
    }
  }

  var body: some View {
    Button {
      action()
    } label: {
      HStack(alignment: .center, spacing: 5) {
        styledButton(status: status)
      }
      .padding([.top, .bottom], 12)
      .frame(maxWidth: .infinity)
    }
    .background(
      RoundedRectangle(cornerRadius: 5)
        .fill(Color.white)
        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
    )
    .overlay(
      RoundedRectangle(cornerRadius: 5)
        .stroke(Color.black.opacity(0.3), lineWidth: 0.5)
    )
  }
}

struct RepoInfoHeader: View {
  var body: some View {
    VStack(alignment: .leading) {
      HStack(alignment: .center) {
        RoundedRectangle(cornerRadius: 5)
          .fill(Color.red)
          .frame(width: 30, height: 30)
        Text("amonshiz")
          .font(.subheadline)
          .foregroundColor(Color(UIColor.darkGray))
        Spacer()
      }

      Text("NavigationTitle")
        .font(.title)
        .boldBlack()
        .padding([.bottom], 8)
      Text("Add a navigation title view to your SwiftUI project")
        .lineLimit(3)

      HStack(spacing: 25) {
        Label {
          Text("477 Stars")
            .font(.callout)
        } icon: {
          Image(systemName: "star")
            .imageScale(.small)
        }
        Label {
          Text("26 Forks")
            .font(.callout)
        } icon: {
          Image(systemName: "point.topleft.down.curvedto.point.bottomright.up")
            .imageScale(.small)
        }
      }
      .padding([.top, .bottom])

      HStack(spacing: 15) {
        InfoHeaderButton(title: "Star", iconName: "star", status: .inactive) {}
        InfoHeaderButton(title: "Watching", iconName: "eye", status: .active(iconColor: .green)) {}
      }
    }
  }
}

struct RepoInfoHeader_Previews: PreviewProvider {
  static var previews: some View {
    RepoInfoHeader()
  }
}
