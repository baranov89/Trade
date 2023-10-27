//
//  ButtonsView.swift
//  Trade
//
//  Created by Алексей Баранов on 19.10.2023.
//

import SwiftUI

struct ButtonsView: View {
    @ObservedObject var vm : TradeViewModel
    @Binding var pair: String
    var body: some View {
        VStack {
            Spacer()
            VStack {
                NavigationLink {
                    CurrencyPairView(pair: $pair)
                    
                } label: {
                    ZStack {
                        Text("\(pair)")
                        HStack {
                            Spacer()
                            Image(systemName: "chevron.forward")
                                .padding(.trailing, 20)
                        }
                    }
                    
                }
                .frame(width: UIScreen.main.bounds.width - 50, height: 54)
                .background(Color(hex: 0x333749))
                .cornerRadius(10)
                .padding(.top, 10)
                HStack {
                    VStack(spacing: 0) {
                        Text("Timer")
                            .font(.system(size: 12))
                            .foregroundColor(Color(hex: 0xC8C8C8, alpha: 1))
                            .padding(.bottom, 4)
                        HStack {
                            Spacer()
                            Button {
                                let t = vm.timer.split(separator: ":", omittingEmptySubsequences: true)
                                var hourInt = Int(t.first!)
                                var minutesInt = Int(t.last!)
                                
                                if minutesInt! > 0 {
                                    minutesInt! -= 1
                                } else {
                                    if hourInt! > 0 {
                                        hourInt! -= 1
                                        minutesInt = 59
                                    }
                                }
                                
                                var hourString = String(hourInt!)
                                if hourString.count == 1 {
                                    hourString = "0" + hourString
                                }
                                var minutesString = String(minutesInt!)
                                if minutesString.count == 1 {
                                    minutesString = "0" + minutesString
                                }
                                vm.timer = hourString + ":" + minutesString
                            } label: {
                                Image(systemName: "minus.circle")
                                    .foregroundColor(Color(hex: 0xC8C8C8, alpha: 1))
                            }

                            Spacer()
                            TextField(text: $vm.timer) {
                                
                            }
                            .multilineTextAlignment(.center)
                            .frame(width: 60)
                            Spacer()
                            Button {
                                let t = vm.timer.split(separator: ":", omittingEmptySubsequences: true)
                                var hourInt = Int(t.first!)
                                var minutesInt = Int(t.last!)
                                
                                if minutesInt! < 59 {
                                    minutesInt! += 1
                                } else {
                                    if hourInt! < 59 {
                                        hourInt! += 1
                                        minutesInt = 00
                                    }
                                }
                                
                                var hourString = String(hourInt!)
                                if hourString.count == 1 {
                                    hourString = "0" + hourString
                                }
                                var minutesString = String(minutesInt!)
                                if minutesString.count == 1 {
                                    minutesString = "0" + minutesString
                                }
                                vm.timer = hourString + ":" + minutesString
                            } label: {
                                Image(systemName: "plus.circle")
                                    .foregroundColor(Color(hex: 0xC8C8C8, alpha: 1))
                            }

                           
                            Spacer()
                        }
                    }
                    .frame(width: (UIScreen.main.bounds.width / 2) - 30, height: 54)
                    .background(Color(hex: 0x333749))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(vm.focus == FocusEnum.timer ? Color(hex: 0x35B972) : .clear, lineWidth: 1)
                    )
                    .onTapGesture {
                        vm.focus = .timer
                        withAnimation {
                            vm.triger = true
                        }
                    }
                    Spacer()
                    VStack(spacing: 0) {
                        Text("Investment")
                            .font(.system(size: 12))
                            .foregroundColor(Color(hex: 0xC8C8C8, alpha: 1))
                            .padding(.bottom, 4)
                        HStack {
                            Spacer()
                            Button {
                                var temp: Int = Int(vm.investment.replacingOccurrences(of: ",", with: ""))!
                                if temp > 0 {
                                    temp -= 100
                                }
                                let t = formatNumberToThousand(number: temp)
                                vm.investment = String(t)
                            } label: {
                                Image(systemName: "minus.circle")
                                    .foregroundColor(Color(hex: 0xC8C8C8, alpha: 1))
                            }
                            Spacer()
                            TextField(text: $vm.investment) {
                                
                            }
                            .multilineTextAlignment(.center)
                            .frame(width: 60)
                            Spacer()
                            Button {
                                var temp: Int = Int(vm.investment.replacingOccurrences(of: ",", with: ""))!
                                if temp < vm.balance {
                                    temp += 100
                                }
                                let t = formatNumberToThousand(number: temp)
                                vm.investment = String(t)
                            } label: {
                                Image(systemName: "plus.circle")
                                    .foregroundColor(Color(hex: 0xC8C8C8, alpha: 1))
                            }
                            Spacer()
                        }
                    }
                    .frame(width: (UIScreen.main.bounds.width / 2) - 30, height: 54)
                    .background(Color(hex: 0x333749))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(vm.focus == FocusEnum.Investment ? Color(hex: 0x35B972) : .clear, lineWidth: 1)
                    )
                    .onTapGesture {
                        vm.focus = .Investment
                        withAnimation {
                            vm.triger = true
                        }
                        
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 50)
                .padding(.vertical, 2)
                HStack {
                    Text("Sell")
                        .font(.system(size: 24))
                        .padding(.leading)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 30, height: 54, alignment: .leading)
                        .background(Color(hex: 0xFE3D43))
                        .cornerRadius(10)
                        .onTapGesture {
                            vm.triger = false
                        }
                    Spacer()
                    Text("Buy")
                        .font(.system(size: 24))
                        .padding(.leading)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 30, height: 54, alignment: .leading)
                        .background(Color(hex: 0x35B972))
                        .cornerRadius(10)
                        .onTapGesture {
                            withAnimation {
                                vm.triger = false
                            }
                            vm.focus = nil
                            vm.alertTriget = true
                        }
                }
                .frame(width: UIScreen.main.bounds.width - 50)
                .background(Color(hex: 0x1E2131, alpha: 1))
                .padding(.bottom, vm.triger ? 260 : 40)
                HStack {
                    
                }
                .frame(width: UIScreen.main.bounds.width, height: 90)
                .background(Color(hex: 0x333749))
            }
            .frame(width: UIScreen.main.bounds.width)
            .background(Color(hex: 0x1E2131, alpha: 1))
        }
        .frame(height: UIScreen.main.bounds.height)
        .foregroundColor(.white)
    }
    
    private func formatNumberToThousand(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = ","
        let formattedNumber = numberFormatter.string(from: NSNumber(value: number))
        return formattedNumber ?? ""
    }
}


#Preview {
    ButtonsView( vm: TradeViewModel(), pair: .constant("GBP/USD"))
}
