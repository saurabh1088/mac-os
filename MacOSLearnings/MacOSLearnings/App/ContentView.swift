//
//  ContentView.swift
//  MacOSLearnings
//
//  Created by Saurabh Verma on 19/09/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var viewModel = SideNavigationMenuViewModel()
    @State private var selectedMenu: MenuCategory?
    @State private var selectedItem: MenuItem?

    var body: some View {
        NavigationSplitView {
            List(viewModel.menu, id: \.id, selection: $selectedMenu) { item in
                NavigationLink(item.title, value: item)
            }
        } content: {
            if let items = selectedMenu?.items {
                List(items, id: \.id, selection: $selectedItem) { item in
                    NavigationLink(item.title, value: item)
                }
            }
        } detail: {
            VStack {
                if selectedMenu?.title == "Container Views" {
                    if selectedItem?.title == "VStack" {
                        VStack {
                            Text("This")
                            Text("is")
                            Text("placed in")
                            Text("a")
                            Text("VStack")
                        }
                    } else {
                        HStack {
                            Text("This")
                            Text("is")
                            Text("placed in")
                            Text("a")
                            Text("HStack")
                        }
                    }
                } else {
                    Text("Detail View \(selectedMenu?.title)")
                    Text("Detail View \(selectedItem?.title)")
                }
            }
        }
    }
    
    @ViewBuilder private var comboHStackVStackOne: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🍎 VStack Demo")
                .font(.title.weight(.bold))

            Text("Vertically stacks views, top-to-bottom.")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Divider()

            Text("First row 😄")
            Text("Second row 🚀")
            Text("Third row 🎯")

            HStack(spacing: 8) {
                Text("👍")
                Text("Works great with")
                Text("emojis")
                Text("too!")
            }
            .font(.headline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .padding()
    }
    
    @ViewBuilder private var comboHStackVStackTwo: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🍏 HStack Demo")
                .font(.title.weight(.bold))

            Text("Horizontally stacks views, left-to-right.")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Divider()

            HStack(spacing: 12) {
                Text("🔥")
                Text("Fast")
                Text("•").foregroundStyle(.secondary)
                Text("⚡️")
                Text("Flexible")
                Text("•").foregroundStyle(.secondary)
                Text("🧩")
                Text("Composable")
            }
            .font(.headline)

            HStack(alignment: .firstTextBaseline, spacing: 8) {
                Text("Baseline")
                    .font(.largeTitle)
                Text("alignment")
                    .font(.body)
                Text("😎")
                    .font(.title)
            }
            .padding(.top, 4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .padding()
    }
}

#Preview {
    ContentView()
}
