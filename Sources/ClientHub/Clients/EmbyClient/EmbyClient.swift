//
//  EmbyClient.swift
//  Demo
//
//  Created by hong on 2025/4/2.
//

import Foundation
import EmbyKit
import SwiftUI

class EmbyClient: ClientProtocol {
    
    let embyClient: EmbyKit.EmbyClient

    init(url: URL) {
        EmbyKit.EmbyClient.configure(client: "VideoRoom",
                             appVersion: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0",
                             deviceId: "<deviceId>",
                             deviceName: "测试")
        
        self.embyClient = .init(baseURL: url)
    }
    
    func login() async throws {
        // Simulate a login page where the user inputs their username and password
        let (username, password) = try await presentLoginPage()
        
        let authenticationResponse = try await embyClient.authenticate(username: username, password: password)
        
        print("\(authenticationResponse.user.name)")
        // TODO: 把token信息在磁盘上持久化
    }
    
    private func presentLoginPage() async throws -> (String, String) {
        return try await withCheckedThrowingContinuation { continuation in
            // Present the login UI
            Task { @MainActor in
                // 使用SwiftUI创建一个简单的登录界面
                let loginView = EmbyLoginView { username, password in
                    continuation.resume(returning: (username, password))
                }
                
                // 创建一个UIHostingController来承载SwiftUI视图
                let hostingController = UIHostingController(rootView: loginView)
                
                // 获取当前的根视图控制器
                if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let rootViewController = scene.windows.first?.rootViewController {
                    // 确保在主线程上呈现登录视图控制器
                    rootViewController.present(hostingController, animated: true, completion: nil)
                }
            }
        }
    }
    
    func detail(id: String) async throws {
        
    }
    
    func addHistory() async throws {
        
    }
    
    func isExpired() async throws -> Bool {
        return false
    }
    
}
