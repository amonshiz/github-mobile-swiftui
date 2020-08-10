//
//  HomeListSection.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/4/20.
//

import SwiftUI

fileprivate struct SectionTitleModifier: ViewModifier {
  #if os(iOS)
  static let topPadding: CGFloat = 15
  static let leadingPadding: CGFloat = -20
  #else
  static let topPadding: CGFloat = 0
  static let leadingPadding: CGFloat = 0
  #endif

  func body(content: Content) -> some View {
    content
//      .padding([.top], Self.topPadding)
//      .padding([.leading], Self.leadingPadding)
//      .textCase(.none)
//      .font(.title3)
//      .foregroundColor(.black)
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
