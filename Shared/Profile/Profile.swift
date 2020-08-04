//
//  Profile.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/4/20.
//

import SwiftUI

struct ProfileInfo: View {
  var body: some View {
    VStack{
      Text("ProfileInfo")
    }
  }
}

struct Pinned: View {
  var body: some View {
    VStack{
      Text("Pinned")
    }
  }
}

struct LinkRow: View {
  let title: String
  let count: Int
  let iconName: String
  let backgroundColor: Color
  
  var body: some View {
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
          Spacer()
          Text("\(count)")
            .font(.callout)
            .foregroundColor(.gray)
        }
      })
      .modifier(HomeListRowModifier())
  }
}

struct Links: View {
  var body: some View {
    Group {
      LinkRow(title: "Repositories", count: 30, iconName: "book.closed", backgroundColor: .purple)
      LinkRow(title: "Starred", count: 30, iconName: "star", backgroundColor: .yellow)
      LinkRow(title: "Organizations", count: 2, iconName: "person.2", backgroundColor: .orange)
    }
  }
}

struct Profile: View {
  var body: some View {
    List {
      ProfileInfo()
      Section {
        Pinned()
        Links()
      }
    }
    .listStyle(GroupedListStyle())
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct Profile_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Profile()
    }
  }
}
