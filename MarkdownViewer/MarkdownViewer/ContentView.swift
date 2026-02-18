//
//  ContentView.swift
//  MarkdownViewer
//
//  Created by Saurabh Verma on 17/02/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MarkdownViewerViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            // Header / Toolbar
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
            }
            .padding()
            .background(Color(NSColor.windowBackgroundColor))
            
            // Main content
            Group {
                if let error = viewModel.errorMessage {
                    errorView(error)
                } else if viewModel.attributedContent == nil {
                    welcomeView
                } else if let content = viewModel.attributedContent {
                    readerView(content)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(minWidth: 720, minHeight: 540)
    }
    
    // MARK: - Subviews
    
    private var welcomeView: some View {
        VStack(spacing: 24) {
            Image(systemName: "doc.richtext.fill")
                .font(.system(size: 72))
                .foregroundStyle(.secondary)
            
            Text("Open a Markdown file to start reading")
                .font(.title2)
                .foregroundStyle(.secondary)
        }
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
    }
    
    private func readerView(_ content: AttributedString) -> some View {
        ScrollView {
            Text(content)
                .font(.system(.body, design: .serif))
                .lineSpacing(8)
                .padding(40)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color(NSColor.textBackgroundColor))
    }
}

#Preview {
    ContentView()
}
