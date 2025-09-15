//
//  SimctlDeviceList.swift
//  SimulatorsHelper
//
//  Created by Saurabh Verma on 15/09/25.
//

import Foundation

struct SimctlDeviceList: Codable {
    let devices: [String: [SimctlDevice]]
}

struct SimctlDevice: Codable {
    let state: String
    let isAvailable: Bool
    let name: String
    let udid: String
    let deviceTypeIdentifier: String
    let dataPath: String
    let dataPathSize: Int
    let logPath: String
}
