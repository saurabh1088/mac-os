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
                Text("This")
                Text("is")
                Text("placed in")
                Text("a")
                Text("HStack")
            }
            Divider()
            HStack {
                Button("Vertical Alignment") {
                    verticalAlignment = .top
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
