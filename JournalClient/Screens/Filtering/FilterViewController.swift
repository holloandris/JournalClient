//
//  FilterViewController.swift
//  JournalClient
//
//  Created by Andras Hollo on 2018. 11. 09..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

import Cocoa

class FilterViewController: NSViewController, LogEntriesManagerDelegate {
    
    // MARK: - Dependency properties
    private var logEntriesManager = MainComponents.shared.logEntriesManager
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logEntriesManager.delegates += self
    }
    
    // MARK: - LogEntriesManagerDelegate
    
    func logEntriesChanged() {
        
    }
    
}
