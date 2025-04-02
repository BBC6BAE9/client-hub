////
////  AliyunpanClient.swift
////  Demo
////
////  Created by ihenryhuang on 2025/4/2.
////
//
//import Foundation
//import AliyunpanSDK
//
//class AliyunpanClient {
//    
//    var client: AliyunpanSDK.AliyunpanClient = AliyunpanSDK.AliyunpanClient (
//        .init(
//            appId: "",
//            scope: ""
//        )
//    )
//    
//    init() {
//        
//    }
//}
//
//extension AliyunpanClient: ClientProtocol {
//    
//    func isExpired() async throws -> Bool {
//        return false
//    }
//    
//    
//    func login() async throws {
//        let token = try await client.authorize(credentials: .pkce)
//        // TODO: 扫库刮削
//        
//    }
//    
//    func detail(id: String) async throws {
//        // TODO: 从刮削库里面获取影片的信息
//        
//    }
//    
//    func addHistory() async throws {
//        // 将历史记录添加到云数据库
//        
//    }
//}
