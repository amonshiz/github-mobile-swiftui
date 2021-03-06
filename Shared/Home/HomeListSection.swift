//
//  HomeListSection.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/4/20.
//

import SwiftUI

fileprivate struct SectionTitleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding([.top], 15)
      .padding([.leading], -20)
      .textCase(.none)
      .font(.title3)
      .foregroundColor(.black)
  }
}

struct HomeListSection<Header, Content>: View where Header: View, Content: View {
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

extension HomeListSection where Header == Text, Content: View {
  init(header: String, @ViewBuilder content: @escaping () -> Content) {
    self.init(header: { Text(header) }, content: content)
  }
}

struct HomeListSection_Previews: PreviewProvider {
  static var previews: some View {
    HomeListSection(header: "Test", content: {})
  }
}
