//
//  ContentView.swift
//  MacOSLearnings
//
//  Created by Saurabh Verma on 19/09/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // TODO: Delete this once proper menu items are created
    let menu: [MenuCategory] = [MenuCategory(title: "Menu One", items: [MenuItem(title: "One A"), MenuItem(title: "One B")]),
                                MenuCategory(title: "Menu Two", items: [MenuItem(title: "Two A"), MenuItem(title: "Two B")]),
                                MenuCategory(title: "Menu Three", items: [MenuItem(title: "Three A"), MenuItem(title: "Three B")])]
    
    @State private var selectedMenu: MenuCategory?
    @State private var selectedItem: MenuItem?

    var body: some View {
        NavigationSplitView {
            List(menu, id: \.id, selection: $selectedMenu) { item in
                NavigationLink(item.title, value: item)
            }
        } content: {
            if let items = selectedMenu?.items {
                List(items, id: \.id, selection: $selectedItem) { item in
                    NavigationLink(item.title, value: item)
                }
            }
        } detail: {
            VStack {
                Text("Detail View \(selectedMenu?.title)")
                Text("Detail View \(selectedItem?.title)")
            }
            
        }
    }
}

#Preview {
    ContentView()
}
