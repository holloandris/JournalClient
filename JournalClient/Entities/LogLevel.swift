//
//  LogLevel.swift
//  JournalClient
//
//  Created by Andras Hollo on 2018. 10. 28..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

import Foundation

enum LogLevel: String, Codable {
    case error
    case warning
    case info
    case debug
    case verbose
}
