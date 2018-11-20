//
//  LogEntryStore.swift
//  JournalClient
//
//  Created by Andras Hollo on 2018. 10. 28..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

import Foundation

protocol LogEntryStoreProtocol {
    var logEntries: [LogEntry] { get }
    func addLogEntry(_ logEntry: LogEntry)
}

class LogEntryStore: LogEntryStoreProtocol {
    
    // MARK: - Public properties
    
    var logEntries: [LogEntry] {
        var logEntries: [LogEntry]?
        queue.sync {
            logEntries = internalLogEntries
        }
        return logEntries!
    }
    
    // MARK: - Private properties
    
    private var internalLogEntries = [LogEntry]()
    private let queue = DispatchQueue(label: "LogEntryStore locking queue")
    
    // MARK: - Action methods
    
    func addLogEntry(_ logEntry: LogEntry) {
        queue.sync { [weak self] in
            self?.internalLogEntries.append(logEntry)
        }
    }
    
}
