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
      Section {
        RepoInfoHeader().background(Color.white)
          .padding([.top, .bottom])
        IconRow(destination: Text("Issues"), style: .base(title: "Issues", iconName: "exclamationmark.circle", backgroundColor: .green))

        IconRow(destination: Text("Pull Requests"), style: .base(title: "Pull Requests", iconName: "point.topleft.down.curvedto.point.bottomright.up", backgroundColor: .blue))

        IconRow(destination: Text("Watchers"), style: .base(title: "Watchers", iconName: "eye", backgroundColor: .purple))

        IconRow(destination: Text("License"), style: .base(title: "License", iconName: "scale.3d", backgroundColor: .red))
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
              .font(.callout)
              .foregroundColor(.gray)
          }
        }
      }

      Text("README.md")
    }
    .listStyle(GroupedListStyle())
  }
}

struct Repo_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Repo()
    }
  }
}
