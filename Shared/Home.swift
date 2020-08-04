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

struct SectionContent<Header, Content>: View where Header: View, Content: View {
  let header: () -> Header
  let content: () -> Content
  
  init(@ViewBuilder header: @escaping () -> Header, @ViewBuilder content: @escaping () -> Content) {
    self.header = header
    self.content = content
  }
  
  var body: some View {
    Section(header:
              header()
              .padding([.bottom], 5)
              .modifier(SectionTitleModifier()),
            content: content)
  }
}

extension SectionContent where Header == Text, Content: View {
  init(header: String, @ViewBuilder content: @escaping () -> Content) {
    self.init(header: { Text(header) }, content: content)
  }
}

struct TempView: View {
  var body: some View {
    List {
      SectionContent(header: "My Work") {
        ForEach(0..<5) { val in
          Text("\(val)")
        }
      }
      
      SectionContent {
        HStack(alignment: .bottom) {
          Text("Favorites")
          Spacer()
          EditButton()
            .modifier(EditButtonModifier())
        }
      } content: {
        ForEach(0..<5) { val in
          Text("\(val)")
        }
      }
      
      SectionContent(header: "Recent") {
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
