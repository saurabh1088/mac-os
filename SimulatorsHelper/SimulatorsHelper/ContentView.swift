//
//  ContentView.swift
//  SimulatorsHelper
//
//  Created by Saurabh Verma on 14/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var didSelectOptionOne: Bool = false
    @State private var didSelectOptionTwo: Bool = false

    var body: some View {
        NavigationSplitView {
            VStack {
                Button {
                    didSelectOptionOne.toggle()
                } label: {
                    Text("Simulators")
                }
                
                Button {
                    didSelectOptionTwo.toggle()
                } label: {
                    Text("Others")
                }

            }
        } detail: {
            if didSelectOptionOne {
                VStack {
                    Image(systemName: "iphone.gen2.motion")
                    Text("All the simulators we have")
                }
            }
            if didSelectOptionTwo {
                VStack {
                    Image(systemName: "arrow.2.circlepath.circle")
                    Text("Other useful stuff")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
