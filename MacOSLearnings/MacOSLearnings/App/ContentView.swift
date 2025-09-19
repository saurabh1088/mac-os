//
//  ContentView.swift
//  MacOSLearnings
//
//  Created by Saurabh Verma on 19/09/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var viewModel = SideNavigationMenuViewModel()
    @State private var selectedMenu: MenuCategory?
    @State private var selectedItem: MenuItem?

    var body: some View {
        NavigationSplitView {
            List(viewModel.menu, id: \.id, selection: $selectedMenu) { item in
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
