//
//  ClassLogEntryFilter.swift
//  JournalClient
//
//  Created by Andras Hollo on 2018. 11. 23..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

import Foundation

class ClassLogEntryFilter: LogEntryFilter {
    
    // MARK: Filtering properties
    var filteredClass: String?
    
    // MARK: LogEntryFilter
    
    func filter(_ logEntry: LogEntry) -> Bool {
        if let filteredClass = filteredClass, filteredClass.count > 0 {
            if let logEntryClass = logEntry.details["Class"] {
                return filteredClass == logEntryClass
            } else { return false }
        } else { return true }
    }
    
}
