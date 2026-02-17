//
//  FolderViewModel.swift
//  MarkdownViewer
//
//  Created by Saurabh Verma on 17/02/26.
//

import Foundation
import SwiftUI
import Combine

struct MarkdownFile: Identifiable, Hashable {
    let id = UUID()
    let url: URL
    var name: String { url.lastPathComponent }
}

class FolderViewModel: ObservableObject {
    @Published var files: [MarkdownFile] = []
    @Published var selectedFile: MarkdownFile?
    @Published var fileContent: String = ""

    func loadFiles(from directory: URL) {
        let fileManager = FileManager.default
        do {
            let contents = try fileManager.contentsOfDirectory(at: directory, includingPropertiesForKeys: nil)
            self.files = contents
                .filter { $0.pathExtension == "md" }
                .map { MarkdownFile(url: $0) }
        } catch {
            print("Error reading directory: \(error)")
        }
    }
}
