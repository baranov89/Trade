//
//  PrpgressView.swift
//  Trade
//
//  Created by Алексей Баранов on 22.10.2023.
//

import SwiftUI

struct PrpgressView: View {
    @State var procent: Int = 0
    @State var width: CGFloat = 0.0
    var timer = MyTimer(interval: 0.1)
    @State var triger = false
    var body: some View {
        ZStack {
            Image("screen", bundle: .main)
                .resizable()
                    .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 40)
                
            ZStack(alignment: .leading) {
                HStack {
                    
                }
                .frame(width: 300, height: 24)
                .background(Color(hex: 0x5B5A60))
                HStack {
                    
                }
                .frame(width: width, height: 24)
                .background(Color(hex: 0x35B972))
                HStack {
                    Text("\(procent)" + "%")
                        .font(.system(size: 16).bold())
                        .foregroundStyle(.white)
                }
                .frame(width: 300, height: 24)
            }
            .frame(width: 300, height: 24)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color(hex: 0x1E2131, alpha: 1))
        .onReceive(timer.currentTimePublisher!, perform: { _ in
            if width < 300 {
                withAnimation {
                    width += 10
                }
                procent = Int(width) / 3
            } else {
                if !triger {
                    triger.toggle()
                    timer.cancellable?.cancel()
                }
                
            }
        })
        .fullScreenCover(isPresented: $triger) {
            NotificationView()
        }
    }
}

#Preview {
    PrpgressView()
}
