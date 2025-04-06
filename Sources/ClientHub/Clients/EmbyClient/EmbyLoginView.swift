//
//  EmbyLoginView.swift
//  Demo
//
//  Created by hong on 2025/4/2.
//

import SwiftUI
import EmbyKit

// Define the LoginView using SwiftUI
struct EmbyLoginView: View {
    @Environment(\.presentationMode) var presentationMode

    @MainActor var onLogin: (AuthenticationResponse) -> Void
    
    @State private var name: String = "synology emby"
    @State private var host: String = "http://192.168.50.106"
    @State private var port: String = "6908"
    @State private var username: String = "xiaoya"
    @State private var password: String = "huanghong0169"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    TextField("name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextField("host", text: $host)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextField("port", text: $port)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Text("Moviers使用Emby官方API直连媒体服务器，使用过程中不会刮削扫描媒体库文件")
                        .foregroundColor(.secondary)
                    
                    Button(action: {
                        
                        presentationMode.wrappedValue.dismiss()

                        Task { @MainActor in
                            do {
                                guard let url = URL(string: "\(host):\(port)") else {
                                    // TODO: throw error
                                    return
                                }
                                let embyClient = EmbyKit.EmbyClient(baseURL: url)
                                let authenticationResponse = try await embyClient.authenticate(username: username, password: password)
                                onLogin(authenticationResponse)
                            } catch {
                                // TODO: throw error
                            }
                        }
                    }) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }
                .padding()
            }
            .navigationTitle("添加Emby")
        }
    }
}

extension AuthenticationResponse: @unchecked Sendable {}
