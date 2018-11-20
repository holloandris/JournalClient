//
//  Logging.swift
//  Journal
//
//  Created by Andras Hollo on 2018. 10. 06..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

enum InternalLogLevel: Int {
    case error = 5
    case warning = 4
    case info = 3
    case debug = 2
    case verbose = 1
}

let logVerbosity = InternalLogLevel.verbose

func log(level: InternalLogLevel, message: String) {
    if logVerbosity.rawValue <= level.rawValue {
        print(message)
    }
}

func logError(_ message: String) {
    log(level: .error, message: "Error: "+message)
}

func logWarn(_ message: String) {
    log(level: .warning, message: "Warning: "+message)
}

func logInfo(_ message: String) {
    log(level: .info, message: "Info: "+message)
}

func logDebug(_ message: String) {
    log(level: .debug, message: "Debug: "+message)
}

func logVerbose(_ message: String) {
    log(level: .verbose, message: "Verbose: "+message)
}
