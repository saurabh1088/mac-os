//
//  MarkdownViewerApp.swift
//  MarkdownViewer
//
//  Created by Saurabh Verma on 17/02/26.
//

import SwiftUI

@main
struct MarkdownReaderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(width: 900, height: 700)
        .windowStyle(.hiddenTitleBar)
        .windowToolbarStyle(.unified(showsTitle: false))
    }
}
