//
//  LogEntry.swift
//  JournalClient
//
//  Created by Andras Hollo on 2018. 10. 28..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

import Foundation

struct LogEntry: Codable {
    let message: String
    let level: LogLevel
    let details: [String: String]
    init(message: String,
         level: LogLevel,
         details: [String: String]) {
        self.message = message
        self.level = level
        self.details = details
    }
}
