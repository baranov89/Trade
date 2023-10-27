//
//  ContentView.swift
//  Trade
//
//  Created by Алексей Баранов on 18.10.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm: TradeViewModel
    @State var pair: String = "EUR/USD"
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack{
                    Text("")
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                .ignoresSafeArea(.all)
                .background(Color(hex: 0x1E2131, alpha: 1))
                .offset(CGSize(width: 0.0, height: -380))
                .zIndex(3)
                SwiftUIWebView(url: URL(filePath: vm.getHtmlPath(pair: pair)!))
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .background(.black)
                    .offset(CGSize(width: 0.0, height: 170))
                
                    .zIndex(1)
                VStack{
                    Text("")
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                .ignoresSafeArea(.all)
                .background(Color(hex: 0x1E2131, alpha: 1))
                .offset(CGSize(width: 0.0, height: 310))
                .zIndex(2)
                VStack {
                    Text("Trade")
                        .font(.system(size: 22))
                        .padding(.top, 70)
                        .foregroundStyle(.white)
                    VStack{
                        Text("Balance")
                            .font(.system(size: 12))
                            .padding(.bottom, 1)
                        Text("\(vm.balance)")
                            .font(.system(size: 16))
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 50, height: 54)
                    .background(Color(hex: 0x333749))
                    .cornerRadius(10)
                    Spacer()
                }
                .frame(height: UIScreen.main.bounds.height)
                .zIndex(4)
                ButtonsView(vm: vm, pair: $pair)
                    .zIndex(5)
            }
        }
            

    }
}


#Preview {
    ContentView(vm: TradeViewModel())
}
