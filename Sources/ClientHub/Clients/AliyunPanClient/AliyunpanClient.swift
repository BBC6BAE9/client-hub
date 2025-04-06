//
//  AliyunpanClient.swift
//  Demo
//
//  Created by hong on 2025/4/2.
//

import Foundation
import AliyunpanSDK

class AliyunpanClient {
    
    var client: AliyunpanSDK.AliyunpanClient = AliyunpanSDK.AliyunpanClient (
        .init(
            appId: "",
            scope: ""
        )
    )
    
    init() {
        
    }
}

extension AliyunpanClient: ClientProtocol {
    func login<AliyunpanToken>() async throws -> AliyunpanToken {
        return try await client.authorize(credentials: .pkce) as! AliyunpanToken
    }
    
    
    var clientID: String {
        return "123"
    }
    
    
    func isExpired() async throws -> Bool {
        return false
    }

    func detail(id: String) async throws {
        // TODO: 从刮削库里面获取影片的信息
        
    }
    
    func addHistory() async throws {
        // 将历史记录添加到云数据库
        
    }
}
