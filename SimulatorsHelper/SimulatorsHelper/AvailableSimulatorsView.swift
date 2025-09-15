//
//  AvailableSimulatorsView.swift
//  SimulatorsHelper
//
//  Created by Saurabh Verma on 15/09/25.
//

import SwiftUI

struct AvailableSimulatorsView: View {
    @State private var showSimulators: Bool = false
    
    var body: some View {
        VStack {
            Button {
                showSimulators.toggle()
            } label: {
                Text("Show available simulators")
            }
            
            Divider()
            
            ScrollView {
                if showSimulators {
                    ForEach(1...100, id: \.self) { index in
                        Text("Simulator \(index)")
                    }
                }
            }
            .frame(height: 250)
        }
    }
}

#Preview {
    AvailableSimulatorsView()
}
