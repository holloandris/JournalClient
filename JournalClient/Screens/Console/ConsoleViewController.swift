//
//  ConsoleViewController.swift
//  JournalClient
//
//  Created by Andras Hollo on 2018. 11. 09..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

import Cocoa

class ConsoleViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource, LogEntriesManagerDelegate {
    
    // MARK: - Dependency properties
    private var logEntriesManager = MainComponents.shared.logEntriesManager
    
    // MARK: - Outlet properties
    @IBOutlet weak var logEntriesTableView: NSTableView!
    
    // MARK: - Private storage properties
    private var logEntries = [LogEntry]()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logEntriesManager.delegates += self
        
        logEntriesTableView.delegate = self
        logEntriesTableView.dataSource = self
    }
    
    // MARK: - LogEntriesManagerDelegate
    
    func logEntriesChanged() {
        DispatchQueue.main.async {
            self.logEntries = self.logEntriesManager.logEntries
            self.logEntriesTableView.reloadData()
            self.logEntriesTableView.scrollRowToVisible(self.logEntries.count-1)
        }
    }
    
    // MARK: - NSTableViewDataSource
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return logEntries.count
    }
    
    // MARK: - NSTableViewDelegate
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "LogEntryCellIdentifier"), owner: nil) as? LogEntryTableCellView {
            cell.logEntryTextField.stringValue = logEntries[row].message
            return cell
        }
        return nil
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return false
    }
    
}
