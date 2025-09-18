//
//  main.swift
//  OSLogVsPrint
//
//  Created by Saurabh Verma on 17/09/25.
//

import Foundation
import OSLog

// MARK: - Loggers
let generalLogger = Logger(subsystem: "com.saurabhverma.OSLogVsPrint", category: "General")
let networkLogger = Logger(subsystem: "com.saurabhverma.OSLogVsPrint", category: "Network")
let dbLogger = Logger(subsystem: "com.saurabhverma.OSLogVsPrint", category: "Database")


// MARK: - Print Demo
func somePrintStatements() {
    print("--------------------------------------------------------------------------------")
    print("From print...")
    print("Hello and welcome to OSLogVsPrint")
    print("This is a macOS based command line tool")
    print("Unlike OSLog, print doesn't gives timestamps or other contextual information so need to add it manually if needed like : \(Date())")
    let workItem = DispatchWorkItem {
        print("Finished printing...")
        print("x------------------------------------------------------------------------------x")
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: workItem)
}


// MARK: - OSLog Demo
func someOSLogStatements() {
    generalLogger.info("--------------------------------------------------------------------------------")
    generalLogger.info("From OSLog…")
    generalLogger.info("Hello and welcome to OSLogVsPrint")
    generalLogger.info("This is a macOS based command line tool")

    // Different levels
    generalLogger.debug("This is a DEBUG level message")
    generalLogger.error("This is an ERROR level message")
    generalLogger.fault("This is a FAULT level message")

    // Privacy demo
    let secret = "MyPassword123"
    generalLogger.info("Secret stored = \(secret)") // default: private
    generalLogger.info("Secret stored (public) = \(secret, privacy: .public)")

    // Other categories
    networkLogger.info("Network call started")
    dbLogger.error("Database connection failed")

    // Async
    DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
        generalLogger.info("Finished logging…")
        generalLogger.info("x------------------------------------------------------------------------------x")
    }
}


// MARK: - Performance Test
func performanceTest() {
    let iterations = 500
    let startPrint = Date()
    for i in 0..<iterations {
        print("Print log \(i)")
    }
    let printTime = Date().timeIntervalSince(startPrint)

    let startOSLog = Date()
    for i in 0..<iterations {
        generalLogger.info("OSLog message \(i, privacy: .public)")
    }
    let logTime = Date().timeIntervalSince(startOSLog)

    print("Performance: print=\(printTime) sec, oslog=\(logTime) sec for \(iterations) messages")
}

// MARK: - Entry
enum Mode {
    case printOnly, oslogOnly, both, perf
}

func parseMode() -> Mode {
    let args = CommandLine.arguments
    if args.contains("--print-only") { return .printOnly }
    if args.contains("--oslog-only") { return .oslogOnly }
    if args.contains("--perf") { return .perf }
    return .both
}

let mode = parseMode()
switch mode {
case .printOnly:
    somePrintStatements()
case .oslogOnly:
    someOSLogStatements()
case .both:
    somePrintStatements()
    someOSLogStatements()
case .perf:
    performanceTest()
}

RunLoop.main.run(until: Date().addingTimeInterval(15))
