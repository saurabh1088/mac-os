//
//  VStackExamplesView.swift
//  MacOSLearnings
//
//  Created by Saurabh Verma on 24/09/25.
//

import SwiftUI

struct VStackExamplesView: View {
    var body: some View {
        VStack {
            Image(systemName: "square.stack.3d.up.fill")
                .resizable()
                .frame(width: 50, height: 50)
            Text("This")
            Text("is")
            Text("placed in")
            Text("a")
            Text("VStack")
        }
    }
}

#Preview {
    VStackExamplesView()
}
