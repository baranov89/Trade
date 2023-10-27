//
//  NotificationView.swift
//  Trade
//
//  Created by Алексей Баранов on 22.10.2023.
//

import SwiftUI

struct NotificationView: View {
    @State var triger = false
    var body: some View {
        VStack {
            ZStack {
                Image("screen", bundle: .main)
                    .resizable()
                        .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 40)
                VStack {
                    
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 40)
                .background(.black.opacity(0.6))
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color(hex: 0x1E2131))
        .onAppear {
            requestNotificationPermissions()
        }
        .fullScreenCover(isPresented: $triger, content: {
            MainView()
        })
    }
    
    func requestNotificationPermissions() {
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print(error)
            } else if success {
                print("success")
                triger.toggle()
            } else {
                print("failure")
            }
        }
    }
}

#Preview {
    NotificationView()
}
