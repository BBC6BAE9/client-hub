//
//  ClientProtocol.swift
//  Demo
//
//  Created by hong on 2025/4/2.
//

import Foundation

/// 视频源客户端协议
protocol ClientProtocol {
    
    // 实现登录方法
    func login() async throws
    
    /// 获取数据详情
    func detail(id: String) async throws
    
    /// 添加观看数据
    func addHistory() async throws
    
    /// 是否过期
    func isExpired() async throws -> Bool
    
}
