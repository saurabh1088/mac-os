//
//  HStackExamplesView.swift
//  MacOSLearnings
//
//  Created by Saurabh Verma on 24/09/25.
//

import SwiftUI

enum HStackAlignmentOption: String, CaseIterable, Identifiable {
    case bottom, top, center, firstTextBaseline, lastTextBaseline
    var id: String { self.rawValue }
    
    // Helper to get the actual SwiftUI alignment value.
    var alignment: VerticalAlignment {
        switch self {
        case .bottom: return .bottom
        case .top: return .top
        case .center: return .center
        case .firstTextBaseline: return .firstTextBaseline
        case .lastTextBaseline: return .lastTextBaseline
        }
    }
    
    var description: String {
        switch self {
        case .bottom: return "Bottom"
        case .top: return "Top"
        case .center: return "Center"
        case .firstTextBaseline: return "First Text Baseline"
        case .lastTextBaseline: return "Last Text Baseline"
        }
    }
}

struct HStackExamplesView: View {
    @State private var verticalAlignment: HStackAlignmentOption = .center
    @State private var spacing: CGFloat = 2
    
    var body: some View {
        VStack {
            Text("HStack Properties Demo")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Divider()
            
            HStack(alignment: verticalAlignment.alignment, spacing: spacing) {
                Image(systemName: "square.stack.3d.down.right.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("This")
                Text("is")
                Text("placed in")
                Text("a")
                Text("HStack")
            }
            .padding(30)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Controls")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                // Use a Picker for a clean way to select an alignment option.
                Picker("Alignment", selection: $verticalAlignment) {
                    ForEach(HStackAlignmentOption.allCases) { option in
                        Text(option.description)
                            .tag(option)
                    }
                }
                .pickerStyle(.menu) // A standard macOS dropdown menu.
                .frame(maxWidth: 300)
                
                // Use a Slider for a more intuitive way to adjust spacing.
                VStack(alignment: .leading) {
                    Text("Spacing: \(spacing, specifier: "%.1f")")
                    Slider(value: $spacing, in: 0...50) {
                        Text("Spacing")
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("50")
                    }
                    .frame(maxWidth: 300)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    HStackExamplesView()
}
