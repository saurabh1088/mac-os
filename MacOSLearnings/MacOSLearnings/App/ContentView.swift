//
//  ContentView.swift
//  MacOSLearnings
//
//  Created by Saurabh Verma on 19/09/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    var body: some View {
        NavigationSplitView {
            MainSidebarMenuItemView(title: "Menu Item 1",
                                    systemImageName: "filemenu.and.pointer.arrow",
                                    customImageName: nil)
        } content: {
            MainSidebarMenuItemView(title: "Sub Menu Item 1",
                                    systemImageName: "filemenu.and.pointer.arrow",
                                    customImageName: nil)
        } detail: {
            Text("Detail View")
        }
    }
}

#Preview {
    ContentView()
}
