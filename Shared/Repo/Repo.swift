//
//  Repo.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/10/20.
//

import SwiftUI

struct Repo: View {
  var body: some View {
    List {
      Section(header: Text("Info Header")) {
        NavigationLink(destination: Text("Issues")) {
          Text("Issues")
        }
        NavigationLink(destination: Text("Pull Requests")) {
          Text("Pull Requests")
        }
        NavigationLink(destination: Text("Watchers")) {
          Text("Watchers")
        }
        NavigationLink(destination: Text("License")) {
          Text("License")
        }
      }

      Section(header:
                HStack {
                  Image(systemName: "point.topleft.down.curvedto.point.bottomright.up")
                  Text("branch name")
                    .textCase(.none)
                  Spacer()
                  Button {
                  } label: {
                    Text("Change")
                      .textCase(.none)
                      .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                  }
                })
      {
        NavigationLink(destination: Text("Brows code")) {
          Text("Browse code")
        }
        NavigationLink(destination: Text("Commits")) {
          HStack {
            Text("Commits")
            Spacer()
            Text("18")
          }
        }
      }
    }
    .listStyle(GroupedListStyle())
  }
}

struct Repo_Previews: PreviewProvider {
  static var previews: some View {
    Repo()
  }
}
