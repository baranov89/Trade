//
//  TopView.swift
//  Trade
//
//  Created by Алексей Баранов on 18.10.2023.
//

import SwiftUI

struct TopView: View {
    @ObservedObject var vm = TopViewModel()
    var timer = MyTimer(interval: 1.0)
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                HStack {
                    Text("№")
                        .frame(width: 10)
                    Text("Country")
                        .frame(width: 50)
                        .padding(.leading, 20)
                    Text("Name")
                        .padding(.leading, 30)
                    Text("Deposit")
                        .padding(.leading, 35)
                    Text("Profit")
                        .padding(.leading, 40)
                        .padding(.trailing, 10)
                }
                .font(.system(size: 12))
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                .background(Color(hex: 0x2E303E))
                ForEach(vm.users) { user in
                    HStack{
                        Text("\(user.id)")
                            .frame(width: 25)
                            .padding(.leading, 7)
                        Image(user.cantry, bundle: .main)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .padding(.leading, 20)
                        Text(user.name)
                            .frame(width: 60)
                            .padding(.leading, 35)
                        
                        Text("$" + "\(user.deposit)")
                            .frame(width: 50)
                            .padding(.leading, 15)
                       
                        Text("$" + "\(user.profit)")
                            .foregroundStyle(.green)
                            .padding(.leading, 20)
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 20, height: 50, alignment: .leading)
                    .background(user.id % 2 != 0 ? .clear : Color(hex: 0x2E303E))
                }
            }
            .frame(width: UIScreen.main.bounds.width - 20)
            .cornerRadius(20)
            .padding(.top, 130)
            Spacer()
            HStack {
                
            }
            .frame(width: UIScreen.main.bounds.width, height: 90)
            .background(Color(hex: 0x333749))
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color(hex: 0x1E2131))
        .onReceive(timer.currentTimePublisher!) { _ in
            var randomInt: [Int] = []
            for _ in 0...3 {
                randomInt.append(Int.random(in: 0...9))
            }
            for i in randomInt {
                vm.users[i].deposit += Int.random(in: 50...150)
                vm.users[i].profit += Int.random(in: 50...150)
            }
        }
    }
}

#Preview {
    TopView()
}
