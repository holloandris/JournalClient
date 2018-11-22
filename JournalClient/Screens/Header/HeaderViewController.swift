//
//  HeaderViewController.swift
//  JournalClient
//
//  Created by Andras Hollo on 2018. 11. 09..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

import Cocoa

class HeaderViewController: NSViewController {
    
    // MARK: - Dependency properties
    private var bonjourManager = MainComponents.shared.bonjourManager
    
    // MARK: - Outlet properties
    @IBOutlet weak var statusLabel: NSTextField!
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bonjourManager.handleConnectionStatusChanged = { [weak self] (status) in
            self?.handleConnectionStatusChanged(status: status)
        }
        
        bonjourManager.startAdvertising()
    }
    
    // MARK: - Event handler methods
    
    private func handleConnectionStatusChanged(status: BonjourServerConnectionStatus) {
        var statusText = ""
        switch status {
        case .idle:
            statusText = "Idle"
        case .listening:
            statusText = "Listening"
        case .connected:
            statusText = "Connected"
        }
        DispatchQueue.main.async {
            self.statusLabel.stringValue = statusText
        }
    }
    
}
