//
//  PinnedSectionCard.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/6/20.
//

import SwiftUI

struct PinnedSectionCard: View {
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        RoundedRectangle(cornerRadius: 5)
          .fill(Color.red)
          .frame(width:30, height: 30)
        Text("amonshiz")
          .foregroundColor(Color(UIColor.darkGray))
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
            .foregroundColor(Color(UIColor.darkGray))
        } icon: {
          Image(systemName: "star.fill")
            .foregroundColor(.yellow)
            .imageScale(.small)
        }

        Label {
          Text("Primary Language")
            .foregroundColor(Color(UIColor.darkGray))
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
