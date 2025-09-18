//
//  main.swift
//  OSLogVsPrint
//
//  Created by Saurabh Verma on 17/09/25.
//

import Foundation
import OSLog

var logger = Logger(subsystem: "com.saurabhverma.OSLogVsPrint", category: "OSLogVsPrint")

func somePrintStatements() {
    print("--------------------------------------------------------------------------------")
    print("From print...")
    print("Hello and welcome to OSLogVsPrint")
    print("This is a macOS based command line tool")
    let workItem = DispatchWorkItem {
        print("Finished printing...")
        print("x------------------------------------------------------------------------------x")
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: workItem)
}

func someOSLogStatements() {
    logger.info("--------------------------------------------------------------------------------")
    logger.info("From OSLog...")
    logger.info("Hello and welcome to OSLogVsPrint")
    logger.info("This is a macOS based command line tool")
    let workItem = DispatchWorkItem {
        logger.info("Finished logging...")
        logger.info("x------------------------------------------------------------------------------x")
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: workItem)
}

somePrintStatements()
someOSLogStatements()
RunLoop.main.run(until: Date().addingTimeInterval(15))
