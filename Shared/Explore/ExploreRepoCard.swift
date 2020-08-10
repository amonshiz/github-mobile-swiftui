//
//  ExploreRepoCard.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/6/20.
//

import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

#if canImport(AppKit)
import AppKit
#endif

struct StarButton: View {
  private enum LocalColor {
    #if canImport(UIKit)
    typealias OutputColor = UIColor
    #elseif canImport(AppKit)
    typealias OutputColor = NSColor
    #endif

    case blue

    var outputColor: OutputColor {
      #if canImport(UIKit)
      switch self {
      case .blue:
        return UIColor.blue
      default:
        fatalError()
      }
      #elseif canImport(AppKit)
      switch self {
      case .blue:
        return NSColor.systemBlue
      default:
        fatalError()
      }
      #endif
    }
  }

  var body: some View {
    Button {
    } label: {
      Label {
        Text("Star")
      } icon: {
        Image(systemName: "star")
      }
      .padding()
      .foregroundColor(Color(LocalColor.blue.outputColor))
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
  private enum LocalColor {
    #if canImport(UIKit)
    typealias OutputColor = UIColor
    #elseif canImport(AppKit)
    typealias OutputColor = NSColor
    #endif

    case lightGray
    case darkGray
    case systemTeal

    var outputColor: OutputColor {
      #if canImport(UIKit)
      switch self {
      case .lightGray:
        return UIColor.lightGray
      case .darkGray:
        return UIColor.darkGray
      case .systemTeal:
        return UIColor.systemTeal
      default:
        fatalError()
      }
      #elseif canImport(AppKit)
      switch self {
      case .lightGray:
        return NSColor.lightGray
      case .darkGray:
        return NSColor.darkGray
      case .systemTeal:
        return NSColor.systemTeal
      default:
        fatalError()
      }
      #endif
    }
  }

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
              .foregroundColor(Color(LocalColor.darkGray.outputColor))
          } icon: {
            Image(systemName: "star.fill")
              .foregroundColor(.yellow)
              .imageScale(.small)
          }

          Label {
            Text("Python")
              .font(.callout)
              .foregroundColor(Color(LocalColor.darkGray.outputColor))
          } icon: {
            Image(systemName:"circle.fill")
              .foregroundColor(Color(LocalColor.systemTeal.outputColor))
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
        .fill(Color(LocalColor.lightGray.outputColor))
    )
  }
}

struct ExploreRepoCard_Previews: PreviewProvider {
  static var previews: some View {
    ExploreRepoCard()
      .padding([.leading, .trailing, .top])
  }
}
