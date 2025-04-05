//
//  EmbyClient.swift
//  Demo
//
//  Created by hong on 2025/4/2.
//

import Foundation
import EmbyKit
import SwiftUI
import CacheKit

@MainActor public class EmbyClient: ClientProtocol {
    
    var embyClient: EmbyKit.EmbyClient?
    
    let cache = DiskCache<AuthenticationResponse>(filename:"EmbyClient", expirationInterval: 30 * 24 * 60 * 60)

    public init() {
        EmbyKit.EmbyClient.configure(client: "VideoRoom",
                             appVersion: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0",
                             deviceId: "<deviceId>",
                             deviceName: "测试")
        
        Task{
            await xxx()
        }
    }
    
    
    func xxx() async {
        try? await cache.loadFromDisk()
        if let authenticationResponse: AuthenticationResponse = try await cache.value(forKey: "emby_token") {
            
            
            let haha = authenticationResponse
            print("------------------------\(authenticationResponse.user.id)")
            print("------------------------\(authenticationResponse.accessToken)")
            print("------------------------\(haha)")
            
//            self.embyClient = EmbyClient(baseURL: URL(string: "")!, userId: authenticationResponse.userId, accessToken: authenticationResponse.accessToken))
            
        }
        

        Task{ @MainActor in
            
//            self.embyClient = EmbyKit.EmbyClient
            
//            embyClient?.accessToken =
        }
    }
    
    public func login() async throws {
        print("@@@@@@")
        // Simulate a login page where the user inputs their username and password
        let authenticationResponse = try await presentLoginPage()
        
        print("user input username: \(authenticationResponse)")
        
        
        // TODO: 把token信息在磁盘上持久化
        await cache.setValue(authenticationResponse, forKey: "emby_token")
        try? await cache.saveToDisk()
        print("@@@@@@")
    }
    
    private func presentLoginPage() async throws -> AuthenticationResponse {
        return try await withCheckedThrowingContinuation { continuation in
            // Present the login UI
            Task { @MainActor in
                // 使用SwiftUI创建一个简单的登录界面
                let loginView = EmbyLoginView { authenticationResponse in
                    continuation.resume(returning: authenticationResponse)
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
