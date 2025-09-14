//
//  Item.swift
//  SimulatorsHelper
//
//  Created by Saurabh Verma on 14/09/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
