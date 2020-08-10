//
//  ProfileInfoSection.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/6/20.
//

import SwiftUI

extension Text {
  func boldBlack() -> Text {
    self.fontWeight(.bold).foregroundColor(.black)
  }
}

struct ProfileInfoSection: View {
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

  private func summaryInfo() -> some View {
    Text("formerly ") + Text("@Instagram").boldBlack() + Text(" ") + Text("@facebook").boldBlack()
  }

  private func socialInfo() -> some View {
    Text("12").boldBlack() + Text(" followers") + Text(" ・ ") + Text("15").boldBlack() + Text(" following")
  }

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        RoundedRectangle(cornerRadius: 5)
          .fill(Color.red)
          .frame(width: 60, height: 60)
        VStack(alignment: .leading) {
          Text("Andrew Monshizadeh")
            .font(.title3)
            .fontWeight(.bold)
          Text("amonshiz")
            .font(.subheadline)
            .foregroundColor(Color(LocalColor.darkGray.outputColor))
        }
        Spacer()
      }

      Label {
        summaryInfo()
      } icon: {
        Image(systemName: "person.2")
          .frame(width: 24, height: 24)
      }
      .foregroundColor(Color(LocalColor.darkGray.outputColor))

      Label {
        Text("New York, NY")
      } icon: {
        Image(systemName: "drop").rotationEffect(.degrees(180))
          .frame(width: 24, height: 24)
      }
      .foregroundColor(Color(LocalColor.darkGray.outputColor))

      Label {
        socialInfo()
      } icon: {
        Image(systemName: "person")
          .frame(width: 24, height: 24)
      }
      .foregroundColor(Color(LocalColor.darkGray.outputColor))
    }
  }
}

struct ProfileInfoSection_Previews: PreviewProvider {
  static var previews: some View {
    ProfileInfoSection()
  }
}
