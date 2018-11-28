//
//  ClassFilterViewController.swift
//  JournalClient
//
//  Created by Andras Hollo on 2018. 11. 23..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

import Cocoa

class ClassFilterViewController: NSViewController, NSTextFieldDelegate {
    
    @IBOutlet weak var classTextField: NSTextField!
    
    // MARK: - Dependency properties
    private var logEntriesManager = MainComponents.shared.logEntriesManager
    private var classLogEntryFilter = ClassLogEntryFilter()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logEntriesManager.logEntryFilters.append(classLogEntryFilter)
    }
    
    // MARK: - NSTextFieldDelegate
    
    func controlTextDidChange(_ obj: Notification) {
        if let textField = obj.object as? NSTextField, textField === classTextField {
            classLogEntryFilter.filteredClass = textField.stringValue
            logEntriesManager.filteringChanged()
        }
    }
    
}
