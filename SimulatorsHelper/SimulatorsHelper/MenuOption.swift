import Foundation
import SwiftUI

enum MenuOption: String, CaseIterable, Identifiable, Hashable {
    case simulators = "Simulators"
    case others = "Others"

    var id: Self { self }
    var label: String { rawValue }
    
    var imageName: String {
        switch self {
        case .simulators: return "iphone.gen2.motion"
        case .others: return "arrow.2.circlepath.circle"
        }
    }
    
    var description: String {
        switch self {
        case .simulators: return "All the simulators we have"
        case .others: return "Other useful stuff"
        }
    }
    
    @ViewBuilder
    var detailView: some View {
        switch self {
        case .simulators:
            AvailableSimulatorsView()
        case .others:
            EmptyView()
        }
    }
}
