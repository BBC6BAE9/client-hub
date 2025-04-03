//
//  SMBClient.swift
//  Demo
//
//  Created by ihenryhuang on 2025/4/2.
//

import Foundation
import SMBClient

class XSMBClient:ClientProtocol {
    func login() async throws {
        let client = SMBClient(host: "198.51.100.50")
        try await client.login(username: "alice", password: "secret")
        try await client.connectShare("Public")

        let files = try await client.listDirectory(path: "")
        print(files.map { $0.name })

        try await client.disconnectShare()
        try await client.logoff()
    }
    
    func detail(id: String) async throws {
        
    }
    
    func addHistory() async throws {
        
    }
    
    func isExpired() async throws -> Bool {
        return false
    }
    
    
}
