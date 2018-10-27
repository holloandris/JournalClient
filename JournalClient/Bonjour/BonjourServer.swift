//
//  BonjourServer.swift
//  JournalClient
//
//  Created by Andras Hollo on 2018. 10. 08..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

import Foundation

enum BonjourServerConnectionStatus {
    case idle, listening, connected
}

protocol BonjourServerDelegate: AnyObject {
    func bonjourServer(didChangeConnectionStatus: BonjourServerConnectionStatus)
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
        delegate?.bonjourServer(didChangeConnectionStatus: .listening)
    }
    
    func netService(_ sender: NetService, didNotPublish errorDict: [String : NSNumber]) {
        logError("Bonjour service did not publish: \(errorDict)")
        delegate?.bonjourServer(didChangeConnectionStatus: .idle)
    }
    
    func netServiceDidStop(_ sender: NetService) {
        logInfo("Bonjour service did stop")
        delegate?.bonjourServer(didChangeConnectionStatus: .idle)
    }
    
}
