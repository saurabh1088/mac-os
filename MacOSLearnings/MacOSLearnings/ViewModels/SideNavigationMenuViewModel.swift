//
//  SideNavigationMenuViewModel.swift
//  MacOSLearnings
//
//  Created by Saurabh Verma on 19/09/25.
//

import Foundation
import Combine

class SideNavigationMenuViewModel: ObservableObject {
    // TODO: Delete this once proper menu items are created
    let menu: [MenuCategory] = [MenuCategory(title: "Menu One", items: [MenuItem(title: "One A"), MenuItem(title: "One B")]),
                                MenuCategory(title: "Menu Two", items: [MenuItem(title: "Two A"), MenuItem(title: "Two B")]),
                                MenuCategory(title: "Menu Three", items: [MenuItem(title: "Three A"), MenuItem(title: "Three B")])]
}
