//
//  ClientProtocol.swift
//  Demo
//
//  Created by hong on 2025/4/2.
//

import Foundation

/// 视频源客户端协议
protocol ClientProtocol {
    
    /// 客户端的唯一标识，例如：clientID, 用于区分不同的客户端
    var clientID: String { get }
    
    // 实现登录方法
    func login<T>() async throws -> T
    
    /// 获取数据详情
    func detail(id: String) async throws
    
    /// 添加观看数据
    func addHistory() async throws
    
    /// 是否过期
    func isExpired() async throws -> Bool
    
}
