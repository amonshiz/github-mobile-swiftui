//
//  PinnedSection.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/6/20.
//

import SwiftUI

struct PinnedSection: View {
  
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
          ForEach(0..<20) { val in
            PinnedSectionCard()
              .frame(width:345)
              .overlay(
                NavigationLink(destination: Text("Destination \(val)")) {
                  Color.clear
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .opacity(0)
                }
              )
          }
          .overlay(
            RoundedRectangle(cornerRadius: 5)
              .stroke(Color(UIColor.darkGray), lineWidth: 1)
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
