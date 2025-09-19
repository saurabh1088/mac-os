//
//  MenuCategory.swift
//  MacOSLearnings
//
//  Created by Saurabh Verma on 19/09/25.
//

import Foundation

struct MenuCategory: Hashable, Identifiable {
    let id: UUID = UUID()
    let title: String
    let items: [MenuItem]
}

struct MenuItem: Hashable, Identifiable {
    let id: UUID = UUID()
    let title: String
}
