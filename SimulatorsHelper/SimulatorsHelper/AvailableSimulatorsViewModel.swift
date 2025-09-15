//
//  AvailableSimulatorsViewModel.swift
//  SimulatorsHelper
//
//  Created by Saurabh Verma on 15/09/25.
//

import Foundation
import SwiftUI

@Observable class AvailableSimulatorsViewModel {
    @ObservationIgnored private let simctlService: SimctlServiceProvider
    
    init(simctlService: SimctlServiceProvider) {
        self.simctlService = simctlService
    }
    
    func loadAvailableSimulators() {
        simctlService.listAvailableSimulators()
    }
}
