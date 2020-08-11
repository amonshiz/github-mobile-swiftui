//
//  IssueSearchController.swift
//  github-mobile (iOS)
//
//  Created by Andrew Monshizadeh on 8/11/20.
//

import SwiftUI

#if canImport(UIKit)

class SearchInsertingViewController: UIViewController {
  override func didMove(toParent parent: UIViewController?) {
    super.didMove(toParent: parent)

    guard let parent = parent else { return }

    let controller = UISearchController()
    controller.searchBar.scopeButtonTitles = ["Open", "Closed"]
    controller.searchBar.showsScopeBar = true
    parent.navigationItem.searchController = controller
    parent.navigationItem.hidesSearchBarWhenScrolling = false
  }
}

struct IssueSearchController: UIViewControllerRepresentable {
  func makeUIViewController(context: Context) -> SearchInsertingViewController {
    return SearchInsertingViewController()
  }

  func updateUIViewController(_ uiViewController: SearchInsertingViewController, context: Context) {}

  typealias UIViewControllerType = SearchInsertingViewController

}

extension View {
  func addSearchController() -> some View {
    self
      .background(
        IssueSearchController()
          .frame(width: 0, height: 0)
          .allowsHitTesting(false)
      )
  }
}

struct IssueSearchController_Previews: PreviewProvider {
    static var previews: some View {
      NavigationView {
        List {
          Text("Hello")
        }
        .navigationTitle("Issues")
        .navigationBarTitleDisplayMode(.inline)
        .addSearchController()
      }
    }
}

#endif // canImport(UIKit)
