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

listSimulators()

