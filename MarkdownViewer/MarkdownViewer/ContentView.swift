//
//  ContentView.swift
//  MarkdownViewer
//
//  Created by Saurabh Verma on 17/02/26.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    @StateObject private var vm = FolderViewModel()

    var body: some View {
        NavigationSplitView {
            // SIDEBAR: Browsing
            List(vm.files, selection: $vm.selectedFile) { file in
                NavigationLink(value: file) {
                    Label(file.name, systemImage: "doc.text")
                }
            }
            .toolbar {
                Button(action: selectFolder) {
                    Label("Open Folder", systemImage: "folder.badge.plus")
                }
            }
        } detail: {
            // DETAIL: Reading
            if let selected = vm.selectedFile {
                MarkdownReaderView(file: selected)
            } else {
                Text("Select a markdown file to start reading")
                    .foregroundColor(.secondary)
            }
        }
    }

    private func selectFolder() {
        let panel = NSOpenPanel()
        panel.canChooseFiles = false
        panel.canChooseDirectories = true
        panel.allowsMultipleSelection = false
        panel.allowedContentTypes = [UTType(tag: "md", tagClass: .filenameExtension, conformingTo: .plainText)!]
        
        if panel.runModal() == .OK, let url = panel.url {
            vm.loadFiles(from: url)
        }
    }
}

#Preview {
    ContentView()
}
