//
//  ContentView.swift
//  MarkdownViewer
//
//  Created by Saurabh Verma on 17/02/26.
//

import SwiftUI

struct MarkdownViewerView: View {
    @StateObject private var viewModel = MarkdownViewerViewModel()
    
    @AppStorage("preferredViewMode") private var preferredViewMode: String = "text"  // "text" or "web"
    
    var body: some View {
        VStack(spacing: 0) {
            // Toolbar
            HStack {
                Button("Open Markdown…") {
                    viewModel.openFile()
                }
                .buttonStyle(.borderedProminent)
                .keyboardShortcut("o", modifiers: .command)
                
                Spacer()
                
                if let name = viewModel.fileName {
                    Text(name)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                // View mode toggle
                Picker("View Mode", selection: $preferredViewMode) {
                    Text("Text").tag("text")
                    Text("Web").tag("web")
                }
                .pickerStyle(.segmented)
                .frame(width: 180)
            }
            .padding()
            .background(Color(NSColor.windowBackgroundColor))
            
            // Main content
            if let error = viewModel.errorMessage {
                errorView(error)
            } else if viewModel.markdownText == nil {
                welcomeView
            } else {
                contentArea
            }
        }
        .frame(minWidth: 720, minHeight: 540)
    }
    
    @ViewBuilder
    private var contentArea: some View {
        if preferredViewMode == "web", let html = viewModel.htmlContent {
            WebView(html: html)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else if let attr = try? AttributedString(markdown: viewModel.markdownText ?? "") {
            ScrollView {
                Text(attr)
                    .font(.system(.body, design: .serif))
                    .lineSpacing(8)
                    .padding(40)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(Color(NSColor.textBackgroundColor))
        } else {
            // Fallback plain text
            ScrollView {
                Text(viewModel.markdownText ?? "")
                    .font(.system(.body, design: .serif))
                    .lineSpacing(8)
                    .padding(40)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(Color(NSColor.textBackgroundColor))
        }
    }
    
    // MARK: - Subviews (unchanged)
    
    private var welcomeView: some View {
        VStack(spacing: 24) {
            Image(systemName: "doc.richtext.fill")
                .font(.system(size: 72))
                .foregroundStyle(.secondary)
            
            Text("Open a Markdown file to start reading")
                .font(.title2)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func errorView(_ message: String) -> some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 60))
                .foregroundStyle(.red)
            
            Text(message)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    MarkdownViewerView()
}
