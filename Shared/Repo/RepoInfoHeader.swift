//
//  RepoInfoHeader.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/10/20.
//

import SwiftUI

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
        Button {
        } label: {
          HStack(alignment: .top, spacing: 5) {
            Image(systemName: "star")
              .imageScale(.medium)
            Text("Star")
          }
          .padding([.top, .bottom])
          .frame(maxWidth: .infinity)
        }
        .background(
          RoundedRectangle(cornerRadius: 5)
            .fill(Color.white)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        )
        .overlay(
          RoundedRectangle(cornerRadius: 5)
            .stroke(Color.gray, lineWidth: 1)
        )
        
        Button {
        } label: {
          HStack(alignment: .center, spacing: 5) {
            Image(systemName: "eye")
              .foregroundColor(.green)
            Text("Watching")
              .foregroundColor(.gray)
          }
          .padding([.top, .bottom])
          .frame(maxWidth: .infinity)
        }
        .background(
          RoundedRectangle(cornerRadius: 5)
            .fill(Color.white)
            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 2)
        )
        .overlay(
          RoundedRectangle(cornerRadius: 5)
            .stroke(Color.gray, lineWidth: 1)
        )
      }
    }
  }
}

struct RepoInfoHeader_Previews: PreviewProvider {
  static var previews: some View {
    RepoInfoHeader()
  }
}
