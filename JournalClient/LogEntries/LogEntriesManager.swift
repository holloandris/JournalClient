//
//  LogEntriesManager.swift
//  JournalClient
//
//  Created by Andras Hollo on 2018. 10. 28..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

import Foundation

protocol LogEntriesManagerDelegate {
    func logEntriesChanged()
}

protocol LogEntriesManagerProtocol {
    var delegates: MulticastDelegate<LogEntriesManagerDelegate> { get set }
    var logEntries: [LogEntry] { get }
    var logEntryFilters: [LogEntryFilter] { get set }
    
    func filteringChanged()
}

class LogEntriesManager: LogEntriesManagerProtocol {
    
    // MARK: - Dependency properties
    
    private var bonjourManager: BonjourManagerProtocol
    private let logEntryStore: LogEntryStoreProtocol
    
    // MARK: - Public properties
    
    var delegates = MulticastDelegate<LogEntriesManagerDelegate>()
    var logEntries: [LogEntry] {
        return logEntryStore.logEntries.filter({ logEntry -> Bool in
            return logEntryFilters.map({ logEntryFilter -> Bool in
                return logEntryFilter.filter(logEntry)
            }).reduce(true, { (isIncluded, filterResult) -> Bool in
                return isIncluded && filterResult
            })
        })
    }
    var logEntryFilters = [LogEntryFilter]()
    
    // MARK: - Lifecycle methods
    
    init(bonjourManager: BonjourManagerProtocol,
         logEntryStore: LogEntryStoreProtocol) {
        self.bonjourManager = bonjourManager
        self.logEntryStore = logEntryStore
        
        self.bonjourManager.handleMessageArrived = { [weak self] message in
            self?.handleMessageArrived(message)
        }
    }
    
    // MARK: - Action methods
    
    func filteringChanged() {
        notifyDelegates()
    }
    
    // MARK: - Event handler methods
    
    private func handleMessageArrived(_ message: String) {
        do {
            if let messageData = message.data(using: .utf8) {
                let logEntry = try JSONDecoder().decode(LogEntry.self, from: messageData)
                logEntryStore.addLogEntry(logEntry)
                notifyDelegates()
            }
        } catch {
            
        }
    }
    
    private func notifyDelegates() {
        delegates.invoke { $0.logEntriesChanged() }
    }
    
}
