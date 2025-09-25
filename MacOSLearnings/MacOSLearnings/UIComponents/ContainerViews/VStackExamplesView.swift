//
//  VStackExamplesView.swift
//  MacOSLearnings
//
//  Created by Saurabh Verma on 24/09/25.
//

import SwiftUI

struct VStackExamplesView: View {
    @State private var horizontalAlignment: HorizontalAlignment = .center
    @State private var spacing: CGFloat = 2
    
    var body: some View {
        VStack {
            Divider()
            VStack(alignment: horizontalAlignment, spacing: spacing) {
                Image(systemName: "square.stack.3d.up.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("This")
                Text("is")
                Text("placed in")
                Text("a")
                Text("VStack")
            }
            Divider()
            
            HStack {
                Button("Horizontal Alignment Center") {
                    horizontalAlignment = .center
                }
                Button("Horizontal Alignment Leading") {
                    horizontalAlignment = .leading
                }
                Button("Horizontal Alignment List Row Separator Leading") {
                    horizontalAlignment = .listRowSeparatorLeading
                }
                Button("Horizontal Alignment List Row Separator Trailing") {
                    horizontalAlignment = .listRowSeparatorTrailing
                }
                Button("Horizontal Alignment Trailing") {
                    horizontalAlignment = .trailing
                }
                Button("Add spacing") {
                    if spacing < 100 {
                        spacing = spacing + 10
                    } else {
                        spacing = 2
                    }
                }
            }
        }
    }
}

#Preview {
    VStackExamplesView()
}
