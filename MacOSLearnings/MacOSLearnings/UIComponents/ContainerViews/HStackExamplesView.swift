//
//  HStackExamplesView.swift
//  MacOSLearnings
//
//  Created by Saurabh Verma on 24/09/25.
//

import SwiftUI

struct HStackExamplesView: View {
    @State private var verticalAlignment: VerticalAlignment = .center
    @State private var spacing: CGFloat = 2
    
    var body: some View {
        VStack {
            Divider()
            HStack(alignment: verticalAlignment, spacing: spacing) {
                Image(systemName: "square.stack.3d.down.right.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("This")
                Text("is")
                Text("placed in")
                Text("a")
                Text("HStack")
            }
            Divider()
            HStack {
                Button("Vertical Alignment Bottom") {
                    verticalAlignment = .bottom
                }
                Button("Vertical Alignment Top") {
                    verticalAlignment = .top
                }
                Button("Vertical Alignment Center") {
                    verticalAlignment = .center
                }
                Button("Vertical Alignment First Text Baseline") {
                    verticalAlignment = .firstTextBaseline
                }
                Button("Vertical Alignment Last Text Baseline") {
                    verticalAlignment = .lastTextBaseline
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
    HStackExamplesView()
}
