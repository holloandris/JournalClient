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
}

class LogEntriesManager: LogEntriesManagerProtocol {
    
    // MARK: - Dependency properties
    
    private var bonjourManager: BonjourManagerProtocol
    private let logEntryStore: LogEntryStoreProtocol
    
    // MARK: - Public properties
    
    var delegates = MulticastDelegate<LogEntriesManagerDelegate>()
    
    // MARK: - Lifecycle methods
    
    init(bonjourManager: BonjourManagerProtocol,
         logEntryStore: LogEntryStoreProtocol) {
        self.bonjourManager = bonjourManager
        self.logEntryStore = logEntryStore
        
        self.bonjourManager.handleMessageArrived = { [weak self] message in
            self?.handleMessageArrived(message)
        }
    }
    
    // MARK: - Event handler methods
    
    private func handleMessageArrived(_ message: String) {
        do {
            if let messageData = message.data(using: .utf8) {
                let logEntry = try JSONDecoder().decode(LogEntry.self, from: messageData)
                logEntryStore.addLogEntry(logEntry)
                delegates.invoke { $0.logEntriesChanged() }
            }
        } catch {
            
        }
    }
    
}
