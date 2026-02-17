//
//  MarkdownReaderView.swift
//  MarkdownViewer
//
//  Created by Saurabh Verma on 17/02/26.
//

import SwiftUI

struct MarkdownReaderView: View {
    let file: MarkdownFile
    @State private var content: String = "Loading..."

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // In the next step, we will swap this for a real MD parser
                Text(content)
                    .font(.system(.body, design: .monospaced))
                    .padding()
            }
        }
        .navigationTitle(file.name)
        .task(id: file) { // Re-runs whenever the selected file changes
            loadContent()
        }
    }

    private func loadContent() {
        // Dispatch to background for large files
        DispatchQueue.global(qos: .userInitiated).async {
            if let text = try? String(contentsOf: file.url) {
                DispatchQueue.main.async {
                    self.content = text
                }
            }
        }
    }
}

// TODO: Fix This
//#Preview {
//    MarkdownReaderView()
//}
