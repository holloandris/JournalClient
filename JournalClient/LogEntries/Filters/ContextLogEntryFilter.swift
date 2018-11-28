//
//  ContextLogEntryFilter.swift
//  JournalClient
//
//  Created by Andras Hollo on 2018. 11. 23..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

import Foundation

class ContextLogEntryFilter: LogEntryFilter {
    
    // MARK: Filtering properties
    var filteredContextName: String?
    var filteredContextValue: String?
    
    // MARK: LogEntryFilter
    
    func filter(_ logEntry: LogEntry) -> Bool {
        if let filteredContextName = filteredContextName, let filteredContextValue = filteredContextValue {
            if let logEntryContextValue = logEntry.details[filteredContextName] {
                return filteredContextValue == logEntryContextValue
            } else { return false }
        } else { return true }
    }
    
}
