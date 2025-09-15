//
//  SimctlService.swift
//  SimulatorsHelper
//
//  Created by Saurabh Verma on 15/09/25.
//

import Foundation

protocol SimctlServiceProvider {
    func listAvailableSimulators()
}

class SimctlService: SimctlServiceProvider {
    // NOTE : This will not work in samndboxed app and below error will be observed
    // xcrun: error: cannot be used within an App Sandbox.
    func listAvailableSimulators() {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/xcrun")
        process.arguments = ["simctl", "list", "devices", "available", "--json"]

        let pipe = Pipe()
        process.standardOutput = pipe

        do {
            try process.run()
            process.waitUntilExit()

            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            guard !data.isEmpty else {
                print("No output from simctl")
                return
            }

            let decoder = JSONDecoder()
            let deviceList = try decoder.decode(SimctlDeviceList.self, from: data)

            for (runtime, devices) in deviceList.devices {
                print("\nRuntime: \(runtime)")
                for device in devices {
                    print("  \(device.name) (\(device.udid)) – \(device.state)")
                }
            }

        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

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
