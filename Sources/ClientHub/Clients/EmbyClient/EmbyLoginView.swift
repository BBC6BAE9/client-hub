//
//  EmbyLoginView.swift
//  Demo
//
//  Created by hong on 2025/4/2.
//

import SwiftUI


// Define the LoginView using SwiftUI
struct EmbyLoginView: View {
    var onLogin: (String, String) -> Void
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                // Ensure the username and password are captured correctly
                onLogin(username, password)
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
}


#Preview {
    EmbyLoginView(onLogin: { _, _ in
        
    })
}
