//
//  ViewController.swift
//  Journal
//
//  Created by Andras Hollo on 2018. 09. 03..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    let bonjourManager = BonjourManager()
    
    @IBOutlet weak var statusLabel: NSTextField!
    @IBOutlet var logsTextView: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bonjourManager.handleMessageArrived = { [weak self] (message) in
            self?.handleMessageArrived(message: message)
        }
        bonjourManager.handleConnectionStatusChanged = { [weak self] (status) in
            self?.handleConnectionStatusChanged(status: status)
        }
        
        bonjourManager.startAdvertising()
    }
    
    private func handleMessageArrived(message: String) {
        DispatchQueue.main.async {
            self.logsTextView.textStorage?.append(NSAttributedString(string: message))
            self.logsTextView.scrollRangeToVisible(NSMakeRange(self.logsTextView.string.count, 0))
        }
    }
    
    private func handleConnectionStatusChanged(status: String) {
        DispatchQueue.main.async {
            self.statusLabel.stringValue = status
        }
    }
    
}
