//
//  PinnedSection.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/6/20.
//

import SwiftUI

struct PinnedSection: View {
  private enum LocalColor {
    #if canImport(UIKit)
    typealias OutputColor = UIColor
    #elseif canImport(AppKit)
    typealias OutputColor = NSColor
    #endif

    case darkGray

    var outputColor: OutputColor {
      #if canImport(UIKit)
      switch self {
      case .darkGray:
        return UIColor.darkGray
      default:
        fatalError()
      }
      #elseif canImport(AppKit)
      switch self {
      case .darkGray:
        return NSColor.darkGray
      default:
        fatalError()
      }
      #endif
    }
  }


  let cardRows = [
    GridItem(.fixed(200))
  ]

  var body: some View {
    VStack(alignment: .leading) {
      Label {
        Text("Pinned").boldBlack()
      } icon: {
        Image(systemName: "pin").rotationEffect(.degrees(-45))
      }

      ScrollView(.horizontal, showsIndicators: false) {
        LazyHGrid(rows: cardRows, spacing: 15) {
          ForEach(0..<20) { _ in
            PinnedSectionCard()
              .frame(width:345)
          }
          .overlay(
            RoundedRectangle(cornerRadius: 5)
              .stroke(Color(LocalColor.darkGray.outputColor), lineWidth: 1)
          )
        }
      }
    }
  }
}

struct PinnedSection_Previews: PreviewProvider {
  static var previews: some View {
    PinnedSection()
  }
}
