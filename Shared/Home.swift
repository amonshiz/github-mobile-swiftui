//
//  Home.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/4/20.
//

import SwiftUI

struct SectionTitleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding([.top], 15)
      .padding([.leading], -20)
      .textCase(.none)
      .font(.title3)
      .foregroundColor(.black)
  }
}

struct EditButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding([.trailing], -20)
      .textCase(.none)
      .font(.subheadline)
      .foregroundColor(.blue)
  }
}

struct TempView: View {
  var body: some View {
    List {
      Section(
        header:
          Text("My Work")
          .modifier(SectionTitleModifier())
          .padding([.bottom], 5)
      ) {
        ForEach(0..<5) { val in
          Text("\(val)")
        }
      }

      Section(
        header:
          HStack(alignment: .bottom) {
            Text("Favorites")
              .modifier(SectionTitleModifier())
            Spacer()
            EditButton()
              .modifier(EditButtonModifier())
          }
          .padding([.bottom], 5)
      ) {
        ForEach(0..<5) { val in
          Text("\(val)")
        }
      }

      Section(
        header:
          Text("Recent")
          .padding([.bottom], 5)
          .modifier(SectionTitleModifier())
      ) {
        ForEach(0..<5) { val in
          Text("\(val)")
        }
      }
    }
  }
}

struct Home: View {
  var body: some View {
    NavigationView {
      TempView()
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Home")
        .toolbar(items: {
          ToolbarItem(placement: .destructiveAction) {
            Circle()
              .fill(Color.red)
              .frame(minWidth: 24, minHeight: 24)
          }
          ToolbarItem(placement: .confirmationAction) {
            Label {
              Text("Add")
            } icon: {
              Image(systemName: "plus.circle")
            }
            .foregroundColor(.blue)
          }
        })
        .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
