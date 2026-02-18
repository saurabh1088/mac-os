//
//  MarkdownViewerApp.swift
//  MarkdownViewer
//
//  Created by Saurabh Verma on 17/02/26.
//

import SwiftUI

@main
struct MarkdownViewerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(.hiddenTitleBar)
        .windowToolbarStyle(.unified(showsTitle: false))
        .defaultSize(width: 900, height: 700)
    }
}
