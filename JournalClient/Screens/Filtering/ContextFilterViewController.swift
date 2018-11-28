//
//  ContextFilterViewController.swift
//  JournalClient
//
//  Created by Andras Hollo on 2018. 11. 23..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

import Cocoa

class ContextFilterViewController: NSViewController, NSTextFieldDelegate {
    
    @IBOutlet weak var contextNameTextField: NSTextField!
    @IBOutlet weak var contextValueTextField: NSTextField!
    
    // MARK: - Dependency properties
    private var logEntriesManager = MainComponents.shared.logEntriesManager
    private var contextLogEntryFilter = ContextLogEntryFilter()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logEntriesManager.logEntryFilters.append(contextLogEntryFilter)
    }
    
    // MARK: - NSTextFieldDelegate
    
    func controlTextDidChange(_ obj: Notification) {
        if let textField = obj.object as? NSTextField {
            if textField === contextNameTextField {
                contextLogEntryFilter.filteredContextName = textField.stringValue
                logEntriesManager.filteringChanged()
            } else if textField === contextValueTextField {
                contextLogEntryFilter.filteredContextValue = textField.stringValue
                logEntriesManager.filteringChanged()
            }
        }
    }
    
}
