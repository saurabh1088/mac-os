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
}

func someOSLogStatements() {
    logger.info("--------------------------------------------------------------------------------")
    logger.info("From OSLog...")
    logger.info("Hello and welcome to OSLogVsPrint")
    logger.info("This is a macOS based command line tool")
}

somePrintStatements()
someOSLogStatements()
