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
            Text("Side bar")
        } detail: {
            Text("Detail View")
        }
    }
}

#Preview {
    ContentView()
}
