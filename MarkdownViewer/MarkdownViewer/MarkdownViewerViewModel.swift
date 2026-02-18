//
//  MarkdownViewerViewModel.swift
//  MarkdownViewer
//
//  Created by Saurabh Verma on 18/02/26.
//

import SwiftUI
import Combine
import WebKit
import UniformTypeIdentifiers

@MainActor
protocol MarkdownViewerViewModelProtocol: ObservableObject {
    var fileName: String? { get }
    var markdownText: String? { get }          // for text view
    var htmlContent: String? { get }           // for web view
    var errorMessage: String? { get }
    var isLoading: Bool { get }
    
    func openFile()
    func loadFile(from url: URL)
}

@MainActor
final class MarkdownViewerViewModel: MarkdownViewerViewModelProtocol {
    @Published var fileName: String? = nil
    @Published var markdownText: String? = nil
    @Published var htmlContent: String? = nil
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    
    func openFile() {
        let panel = NSOpenPanel()
        panel.allowedContentTypes = [UTType(filenameExtension: "md")!, .plainText]
        panel.allowsMultipleSelection = false
        panel.canChooseDirectories = false
        
        if panel.runModal() == .OK, let url = panel.url {
            loadFile(from: url)
        }
    }
    
    func loadFile(from url: URL) {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                guard url.startAccessingSecurityScopedResource() else {
                    throw NSError(domain: "FileAccess", code: -1,
                                  userInfo: [NSLocalizedDescriptionKey: "Cannot access file"])
                }
                defer { url.stopAccessingSecurityScopedResource() }
                
                let content = try String(contentsOf: url, encoding: .utf8)
                
                // Prepare both representations
                let attr = (try? AttributedString(markdown: content)) ?? AttributedString(content)
                let simpleHTML = """
                <div style="padding: 2rem; max-width: 900px; margin: 0 auto; font-family: serif; line-height: 1.7;">
                    \(content.replacingOccurrences(of: "\n", with: "<br>"))
                </div>
                """
                
                await MainActor.run {
                    self.fileName = url.lastPathComponent
                    self.markdownText = content
                    self.htmlContent = simpleHTML   // fallback; replace with real parser if desired
                    self.errorMessage = nil
                    self.isLoading = false
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = "Failed to load file: \(error.localizedDescription)"
                    self.isLoading = false
                }
            }
        }
    }
}
