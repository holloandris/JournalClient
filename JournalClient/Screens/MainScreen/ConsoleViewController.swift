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
            self.logEntriesTableView.reloadData()
        }
    }
    
    // MARK: - NSTableViewDataSource
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 1000
    }
    
    // MARK: - NSTableViewDelegate
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "LogEntryCellIdentifier"), owner: nil) as? NSTableCellView {
            return cell
        }
        return nil
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return false
    }
    
}
