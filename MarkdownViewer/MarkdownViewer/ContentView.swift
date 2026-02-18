//
//  ContentView.swift
//  MarkdownViewer
//
//  Created by Saurabh Verma on 17/02/26.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    @State private var selectedFileURL: URL? = nil
    @State private var markdownText: String = ""
    @State private var attributedMarkdown: AttributedString? = nil
    @State private var errorMessage: String? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            // Toolbar / header
            HStack {
                Button("Open Markdown File…") {
                    openFilePicker()
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
                if let filename = selectedFileURL?.lastPathComponent {
                    Text(filename)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .padding()
            .background(Color(NSColor.windowBackgroundColor))
            
            // Main content area
            if let error = errorMessage {
                VStack {
                    Image(systemName: "exclamationmark.triangle")
                        .font(.largeTitle)
                        .foregroundStyle(.red)
                    Text(error)
                        .foregroundStyle(.red)
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if markdownText.isEmpty {
                // Welcome screen
                VStack(spacing: 20) {
                    Image(systemName: "doc.richtext.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(.secondary)
                    
                    Text("Select a .md file to read")
                        .font(.title2)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let attributed = attributedMarkdown {
                // Rendered Markdown
                ScrollView {
                    Text(attributed)
                        .font(.system(.body, design: .serif))
                        .lineSpacing(6)
                        .padding(24)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .background(Color(NSColor.textBackgroundColor))
            }
        }
        .frame(minWidth: 680, minHeight: 500)
    }
    
    private func openFilePicker() {
        let panel = NSOpenPanel()
        panel.allowedContentTypes = [UTType(filenameExtension: "md")!, UTType.plainText]
        panel.allowsMultipleSelection = false
        panel.canChooseDirectories = false
        
        if panel.runModal() == .OK, let url = panel.url {
            loadMarkdown(from: url)
        }
    }
    
    private func loadMarkdown(from url: URL) {
        do {
            guard url.startAccessingSecurityScopedResource() else {
                errorMessage = "Cannot access the selected file"
                return
            }
            defer { url.stopAccessingSecurityScopedResource() }
            
            let content = try String(contentsOf: url, encoding: .utf8)
            markdownText = content
            
            // Convert Markdown → AttributedString
            if let attr = try? AttributedString(markdown: content) {
                attributedMarkdown = attr
            } else {
                // Fallback: plain text if Markdown parsing fails
                attributedMarkdown = AttributedString(content)
            }
            
            selectedFileURL = url
            errorMessage = nil
        } catch {
            errorMessage = "Failed to read file: \(error.localizedDescription)"
        }
    }
}

#Preview {
    ContentView()
}
