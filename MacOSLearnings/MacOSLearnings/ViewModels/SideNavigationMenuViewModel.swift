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
    let menu: [MenuCategory] = [MenuCategory(title: "Container Views",
                                             items: [MenuItem(title: "HStack"),
                                                     MenuItem(title: "VStack")]),
                                MenuCategory(title: "Menu Two",
                                             items: [MenuItem(title: "Two A"),
                                                     MenuItem(title: "Two B")]),
                                MenuCategory(title: "Menu Three",
                                             items: [MenuItem(title: "Three A"),
                                                     MenuItem(title: "Three B")])]
}
