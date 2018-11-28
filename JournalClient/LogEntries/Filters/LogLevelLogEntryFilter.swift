//
//  LogLevelLogEntryFilter.swift
//  JournalClient
//
//  Created by Andras Hollo on 2018. 11. 23..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

import Foundation

class LogLevelLogEntryFilter: LogEntryFilter {
    
    // MARK: Filtering properties
    var enableErrorLogLevel = true
    var enableWarningLogLevel = true
    var enableInfoLogLevel = true
    var enableDebugLogLevel = true
    var enableVerboseLogLevel = true
    
    // MARK: LogEntryFilter
    
    func filter(_ logEntry: LogEntry) -> Bool {
        switch logEntry.level {
        case .error:
            return enableErrorLogLevel
        case .warning:
            return enableWarningLogLevel
        case .info:
            return enableInfoLogLevel
        case .debug:
            return enableDebugLogLevel
        case .verbose:
            return enableVerboseLogLevel
        }
    }
    
}
