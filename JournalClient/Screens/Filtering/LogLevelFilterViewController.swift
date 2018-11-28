//
//  LogLevelFilterViewController.swift
//  JournalClient
//
//  Created by Andras Hollo on 2018. 11. 23..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

import Cocoa

class LogLevelFilterViewController: NSViewController {
    
    @IBOutlet weak var errorButton: NSButton!
    @IBOutlet weak var warningButton: NSButton!
    @IBOutlet weak var infoButton: NSButton!
    @IBOutlet weak var debugButton: NSButton!
    @IBOutlet weak var verboseButton: NSButton!
    
    // MARK: - Dependency properties
    private var logEntriesManager = MainComponents.shared.logEntriesManager
    private var logLevelLogEntryFilter = LogLevelLogEntryFilter()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logEntriesManager.logEntryFilters.append(logLevelLogEntryFilter)
    }
    
    // MARK: - Action methods
    
    @IBAction func errorButtonClicked(_ sender: Any) {
        logLevelLogEntryFilter.enableErrorLogLevel = (errorButton.state == .on)
        logEntriesManager.filteringChanged()
    }
    
    @IBAction func warningButtonClicked(_ sender: Any) {
        logLevelLogEntryFilter.enableWarningLogLevel = (warningButton.state == .on)
        logEntriesManager.filteringChanged()
    }
    
    @IBAction func infoButtonClicked(_ sender: Any) {
        logLevelLogEntryFilter.enableInfoLogLevel = (infoButton.state == .on)
        logEntriesManager.filteringChanged()
    }
    
    @IBAction func debugButtonClicked(_ sender: Any) {
        logLevelLogEntryFilter.enableDebugLogLevel = (debugButton.state == .on)
        logEntriesManager.filteringChanged()
    }
    
    @IBAction func verboseButtonClicked(_ sender: Any) {
        logLevelLogEntryFilter.enableVerboseLogLevel = (verboseButton.state == .on)
        logEntriesManager.filteringChanged()
    }
    
}
