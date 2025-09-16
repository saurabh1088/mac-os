//
//  main.swift
//  SimctlHelper
//
//  Created by Saurabh Verma on 16/09/25.
//

import Foundation

func listSimulators() {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/usr/bin/xcrun")
    process.arguments = ["simctl", "list", "devices", "available", "--json"]
    
    let pipe = Pipe()
    process.standardOutput = pipe
    process.standardError = pipe
    
    do {
        try process.run()
    } catch {
        print("❌ Failed to run process: \(error)")
        return
    }
    
    process.waitUntilExit()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    
    if let output = String(data: data, encoding: .utf8) {
        print("📱 Available Simulators:\n")
        print(output)
    } else {
        print("❌ Could not read output")
    }
}

func listSimulatorsParsed() {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/usr/bin/xcrun")
    process.arguments = ["simctl", "list", "devices", "available", "--json"]

    let pipe = Pipe()
    process.standardOutput = pipe

    try? process.run()
    process.waitUntilExit()

    let data = pipe.fileHandleForReading.readDataToEndOfFile()

    if let decoded = try? JSONDecoder().decode(SimctlDeviceList.self, from: data) {
        print("📱 Available Simulators:\n")
        for (runtime, devices) in decoded.devices {
            print("Runtime: \(runtime)")
            for device in devices {
                print("  • \(device.name) (\(device.state)) - \(device.udid)")
            }
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


listSimulatorsParsed()

