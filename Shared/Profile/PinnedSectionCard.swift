//
//  PinnedSectionCard.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/6/20.
//

import SwiftUI

struct PinnedSectionCard: View {
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

    var body: some View {
      VStack(alignment: .leading) {
        HStack {
          RoundedRectangle(cornerRadius: 5)
            .fill(Color.red)
            .frame(width:30, height: 30)
          Text("amonshiz")
            .foregroundColor(Color(LocalColor.darkGray.outputColor))
          Spacer()
        }
        Text("Repo Title")
          .font(.headline)

        Text("Add a navigation title view to your SwiftUI project")
          .padding([.top, .bottom], 4)
        Spacer()

        HStack {
          Label {
            Text("Stars")
              .foregroundColor(Color(LocalColor.darkGray.outputColor))
          } icon: {
            Image(systemName: "star.fill")
              .foregroundColor(.yellow)
              .imageScale(.small)
          }

          Label {
            Text("Primary Language")
              .foregroundColor(Color(LocalColor.darkGray.outputColor))
          } icon: {
            Image(systemName: "circle.fill")
              .foregroundColor(.yellow)
              .imageScale(.small)
          }
        }
      }
      .padding()
    }
}

struct PinnedSectionCard_Previews: PreviewProvider {
    static var previews: some View {
        PinnedSectionCard()
          .frame(width: 345, height: 200)
          .border(Color.black)
    }
}
