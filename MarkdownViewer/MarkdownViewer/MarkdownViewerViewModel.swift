//
//  MarkdownViewerViewModel.swift
//  MarkdownViewer
//
//  Created by Saurabh Verma on 18/02/26.
//

import SwiftUI
import Combine
import UniformTypeIdentifiers

@MainActor
protocol MarkdownViewerViewModelProtocol: ObservableObject {
    var fileName: String? { get }
    var attributedContent: AttributedString? { get }
    var errorMessage: String? { get }
    var isLoading: Bool { get }
    
    func openFile()
    func loadFile(from url: URL)
}

@MainActor
final class MarkdownViewerViewModel: MarkdownViewerViewModelProtocol {
    @Published var fileName: String? = nil
    @Published var attributedContent: AttributedString? = nil
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    
    private var currentURL: URL?
    
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
                    throw NSError(domain: "FileAccess", code: -1, userInfo: [NSLocalizedDescriptionKey: "Cannot access file"])
                }
                defer { url.stopAccessingSecurityScopedResource() }
                
                let content = try String(contentsOf: url, encoding: .utf8)
                
                let attr: AttributedString
                if let parsed = try? AttributedString(markdown: content) {
                    attr = parsed
                } else {
                    attr = AttributedString(content) // fallback
                }
                
                await MainActor.run {
                    self.currentURL = url
                    self.fileName = url.lastPathComponent
                    self.attributedContent = attr
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
