//
//  SourceCode.swift
//  github-mobile
//
//  Created by Andrew Monshizadeh on 8/11/20.
//

import SwiftUI

private let licenseText =
  """
MIT License

Copyright (c) 2020 Andrew Monshizadeh

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
"""

let licenseTextLines =
  Array(Array(repeating: licenseText, count: 10).joined(separator: "\n\n")

          .split(maxSplits: Int.max, omittingEmptySubsequences: false, whereSeparator: { $0.isNewline }).enumerated())

let licenseTextLinesCount = licenseTextLines.count

struct GutterWidthPreference {
  let bounds: Anchor<CGRect>
}

struct GutterWidthPreferenceKey: PreferenceKey {
  typealias Value = [GutterWidthPreference]

  static var defaultValue: [GutterWidthPreference] = []

  static func reduce(value: inout [GutterWidthPreference], nextValue: () -> [GutterWidthPreference]) {
    value.append(contentsOf: nextValue())
  }
}

struct GutterText: View {
  let lineNum: Int
  static let trailingPadding: CGFloat = 4
  static let leadingPadding: CGFloat = -4

  var body: some View {
    Text(String(licenseTextLinesCount))
      .font(Font.system(.body, design: .monospaced))
      .padding([.trailing], Self.trailingPadding)
      .padding([.leading], Self.leadingPadding)
      .opacity(0)
      .overlay(
        Text(String(lineNum))
          .font(Font.system(.caption, design: .monospaced))
          .padding([.trailing], Self.trailingPadding)
        , alignment: .trailing)
      .anchorPreference(key: GutterWidthPreferenceKey.self, value: .bounds, transform: { anchor in
        [GutterWidthPreference(bounds: anchor)]
      })
  }
}

struct GutterBackground: View {
  let width: CGFloat

  var body: some View {
    HStack(spacing: 0) {
      Rectangle()
        .fill(Color.black.opacity(0.15))
        .frame(width: width)
      Rectangle()
        .fill(Color(.sRGB, white: 0.5, opacity: 1.0))
        .frame(width:1)
    }
  }
}

extension View {
  func addGutterBackground() -> some View {
    self
      .backgroundPreferenceValue(GutterWidthPreferenceKey.self) { value in
        GeometryReader { geo in
          HStack {
            GutterBackground(width: value.first != nil ? geo[value.first!.bounds].width : 0)
          }
        }
      }

  }
}

struct SourceCode: View {
  var body: some View {
    ScrollView {
      LazyVStack(alignment: .leading) {
        ForEach(licenseTextLines, id: \.0) { (lineNum, text) in
          HStack(alignment: VerticalAlignment.firstTextBaseline) {
            GutterText(lineNum: lineNum)
              .foregroundColor(Color(.sRGB, white: 0.5, opacity: 1.0))
            Text(text)
              .font(Font.system(.caption, design: .monospaced))
          }
        }

        Rectangle()
          .fill(Color(.sRGB, white: 0.5, opacity: 1.0))
          .frame(height: 1)
      }
      .addGutterBackground()
    }
    .navigationTitle("License")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct SourceCode_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      SourceCode()
    }
  }
}
