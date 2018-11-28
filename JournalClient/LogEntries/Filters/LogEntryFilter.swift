//
//  LogEntryFilter.swift
//  JournalClient
//
//  Created by Andras Hollo on 2018. 11. 23..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

protocol LogEntryFilter {
    func filter(_ logEntry: LogEntry) -> Bool
}
