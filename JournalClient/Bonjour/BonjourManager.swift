//
//  BonjourManager.swift
//  Journal
//
//  Created by Andras Hollo on 2018. 09. 30..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

import Foundation

class BonjourManager: BonjourServerDelegate, SocketDelegate {
    
    var handleMessageArrived: ((String) -> Void)?
    var handleConnectionStatusChanged: ((BonjourServerConnectionStatus) -> Void)?
    
    private let port = 9999
    
    private let bonjourServer = BonjourServer()
    private let socket = Socket()
    
    // MARK: - Lifecycle methods
    
    init() {
        bonjourServer.delegate = self
        socket.delegate = self
    }
    
    // MARK: - Action methods
    
    func startAdvertising() {
        socket.open(withPort: port)
        bonjourServer.publishService(onPort: port)
    }
    
    // MARK: - BonjourServerDelegate
    
    func bonjourServer(didChangeConnectionStatus connectionStatus: BonjourServerConnectionStatus) {
        handleConnectionStatusChanged?(connectionStatus)
    }
    
    // MARK: - SocketDelegate
    
    func socketDidConnect() {
        handleConnectionStatusChanged?(.connected)
    }
    
    func socketDidDisconnect() {
        handleConnectionStatusChanged?(.listening)
    }
    
    func socket(didReceiveMessage message: String) {
        handleMessageArrived?(message)
    }
    
}
