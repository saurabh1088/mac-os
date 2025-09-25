//
//  VStackExamplesView.swift
//  MacOSLearnings
//
//  Created by Saurabh Verma on 24/09/25.
//

import SwiftUI

enum VStackAlignmentOption: String, CaseIterable, Identifiable {
    case leading, center, trailing, listRowSeparatorLeading, listRowSeparatorTrailing
    var id: String { self.rawValue }
    
    // Helper to get the actual SwiftUI alignment value.
    var alignment: HorizontalAlignment {
        switch self {
        case .leading: return .leading
        case .center: return .center
        case .trailing: return .trailing
        case .listRowSeparatorLeading: return .listRowSeparatorLeading
        case .listRowSeparatorTrailing: return .listRowSeparatorTrailing
        }
    }
    
    var description: String {
        switch self {
        case .leading: return "Leading"
        case .center: return "Center"
        case .trailing: return "Trailing"
        case .listRowSeparatorLeading: return "List Row Separator Leading"
        case .listRowSeparatorTrailing: return "List Row Separator Trailing"
        }
    }
}

struct VStackExamplesView: View {
    @State private var horizontalAlignment: VStackAlignmentOption = .center
    @State private var spacing: CGFloat = 2
    
    var body: some View {
        VStack {
            Text("VStack Properties Demo")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Divider()
            
            VStack(alignment: horizontalAlignment.alignment, spacing: spacing) {
                Image(systemName: "square.stack.3d.up.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Text("This")
                Text("is")
                Text("placed in")
                Text("a")
                Text("VStack")
            }
            .padding(30)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Controls")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                // Use a Picker for a clean way to select an alignment option.
                Picker("Alignment", selection: $horizontalAlignment) {
                    ForEach(VStackAlignmentOption.allCases) { option in
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
    VStackExamplesView()
}
