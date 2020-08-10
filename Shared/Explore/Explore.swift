//
//  Explore.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/4/20.
//

import SwiftUI

struct Explore: View {
  private enum LocalColor {
    #if canImport(UIKit)
    typealias OutputColor = UIColor
    #elseif canImport(AppKit)
    typealias OutputColor = NSColor
    #endif

    case systemGroupedBackground

    var outputColor: OutputColor {
      #if canImport(UIKit)
      switch self {
      case .systemGroupedBackground:
        return UIColor.systemGroupedBackground
      default:
        fatalError()
      }
      #elseif canImport(AppKit)
      switch self {
      case .systemGroupedBackground:
        return NSColor.lightGray
      default:
        fatalError()
      }
      #endif
    }
  }

  var body: some View {
    applyTitleDisplayMode(
      content:
        NavigationView {
          ScrollView(.vertical) {
            VStack {
              ExploreRepoCard()
                .padding([.leading, .trailing, .top])

              Text("For You")
              ScrollView(.horizontal) {
                LazyHStack {
                  ForEach(0..<20) { _ in
                    Text("For You")
                  }
                }
              }

              Text("Treanding today")
              ScrollView(.horizontal) {
                LazyHStack {
                  ForEach(0..<20) { _ in
                    Text("Trending")
                  }
                }
              }
            }
          }
          .background(
            Color(LocalColor.systemGroupedBackground.outputColor)
              .ignoresSafeArea()
          )
          .navigationTitle("Explore")
        })
  }

  func applyTitleDisplayMode<Content: View>(content: Content) -> some View {
    #if !os(macOS)
    return content.navigationBarTitleDisplayMode(.large)
    #else
    return content
    #endif
  }
}

struct Explore_Previews: PreviewProvider {
  static var previews: some View {
    Explore()
  }
}
