//
//  MainComponents.swift
//  JournalClient
//
//  Created by Andras Hollo on 2018. 10. 28..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

import Foundation

class MainComponents {
    
    static let shared = MainComponents()
    
    private init() {}
    
    // MARK: - Main Components
    
    lazy var logEntryStore: LogEntryStoreProtocol = {
       return LogEntryStore()
    }()
    
    lazy var bonjourManager: BonjourManagerProtocol = {
        return BonjourManager()
    }()
    
    lazy var logEntriesManager: LogEntriesManagerProtocol = {
        return LogEntriesManager(bonjourManager: bonjourManager, logEntryStore: logEntryStore)
    }()
    
}
