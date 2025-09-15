//
//  ContentView.swift
//  SimulatorsHelper
//
//  Created by Saurabh Verma on 15/09/25.
//

import SwiftUI

struct MainLandingPage: View {
    @State private var selectedMenu: MenuOption? = .simulators

    var body: some View {
        NavigationSplitView {
            List(MenuOption.allCases, id: \.self, selection: $selectedMenu) { option in
                Label(option.label, systemImage: option.imageName)
            }
        } detail: {
            selectedMenu?.detailView
        }
    }
}

#Preview {
    MainLandingPage()
}
