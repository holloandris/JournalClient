//
//  BonjourServer.swift
//  JournalClient
//
//  Created by Andras Hollo on 2018. 10. 08..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

import Foundation

protocol BonjourServerDelegate: AnyObject {
    func bonjourServer(didChangeConnectionStatus: String)
}

class BonjourServer: NSObject, NetServiceDelegate {
    
    weak var delegate: BonjourServerDelegate?
    
    private var service: NetService!
    
    // MARK: - Action methods
    
    func publishService(onPort port: Int) {
        service = NetService(domain: "", type: "_journal._tcp", name: "", port: Int32(port))
        service.delegate = self
        service.publish()
    }
    
    func stopService() {
        service.stop()
        service = nil
    }
    
    // MARK: - NetServiceDelegate
    
    func netServiceDidPublish(_ sender: NetService) {
        logInfo("Bonjour service did publish")
        delegate?.bonjourServer(didChangeConnectionStatus: "Listening")
    }
    
    func netServiceDidStop(_ sender: NetService) {
        logDebug("Bonjour service did stop")
        delegate?.bonjourServer(didChangeConnectionStatus: "Idle")
    }
    
    func netService(_ sender: NetService, didNotPublish errorDict: [String : NSNumber]) {
        logError("Bonjour service did not publish: \(errorDict)")
    }
    
    func netService(_ sender: NetService, didNotResolve errorDict: [String : NSNumber]) {
        logError("Bonjour service did not resolve: \(errorDict)")
    }
    
    func netService(_ sender: NetService, didAcceptConnectionWith inputStream: InputStream, outputStream: OutputStream) {
        logDebug("Bonjour service did accept connection")
    }
    
    func netServiceDidResolveAddress(_ sender: NetService) {
        logDebug("Bonjour service did resolve address")
    }
    
    func netService(_ sender: NetService, didUpdateTXTRecord data: Data) {
        logDebug("Bonjour service did update TXT record")
    }
    
}
