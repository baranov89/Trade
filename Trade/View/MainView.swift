//
//  MainView.swift
//  Trade
//
//  Created by Алексей Баранов on 18.10.2023.
//

import SwiftUI

struct KeyboardValue: Hashable {
    var number: Int?
    var simbol: String?
}


struct MainView: View {
    @ObservedObject var vm = TradeViewModel()
    let tabBar = UITabBar.appearance()
    @State var selectedTag = 1
    var body: some View {
        ZStack{
                TabView(selection: $selectedTag) {
                    ContentView(vm: vm)
                        .tag(0)
                        .tabItem {
                            VStack {
                                Text("Trade")
                                Image(selectedTag == 0 ? "Vector2" : "Vector", bundle: .main)
                            }
                        }
                    TopView()
                        .tag(1)
                        .tabItem {
                            VStack {
                                Text("Top")
                                Image(selectedTag == 1 ? "User2" : "User", bundle: .main)
                            }
                        }
                }
                .accentColor(Color(hex: 0x35B972))
            .alert("successFully", isPresented: $vm.alertTriget, actions: {
                Button {
                    let randomValue = Int.random(in: 1...3)
                    var bid: Double = 0.0
                    if randomValue != 1 {
                        bid =  Double(vm.investment.replacingOccurrences(of: ",", with: ""))! * 7 / 10
                        vm.balance += Int(bid)
                    } else {
                        vm.balance -= Int(vm.investment.replacingOccurrences(of: ",", with: ""))!
                    }
                } label: {
                    Text("ok")
                }
            }, message: {
                Text("investment " + "\(vm.investment)")
            })
            .zIndex(1)
            if vm.triger {
                VStack{
                    Spacer()
                    VStack{
                        VStack{
                            ForEach(vm.array, id: \.self) { item in
                                HStack{
                                    ForEach(item, id: \.self) { value in
                                        Button {
                                            pushButton(value: value)
                                        } label: {
                                            VStack {
                                                if value.number == nil && value.simbol == nil {
                                                    Image(systemName: "delete.backward")
                                                        .foregroundStyle(.white)
                                                } else {
                                                    if value.number == nil {
                                                        Text("")
                                                    } else {
                                                        Text("\(value.number ?? 1)")
                                                            .font(.system(size: 25))
                                                        Text(value.simbol ?? "")
                                                            .font(.system(size: 10).bold())
                                                    }
                                                }
                                            }
                                            .frame(width: 118, height: 47)
                                            .foregroundColor(.white)
                                            .background(value.number == nil ? .black : Color(hex: 0x6F6F70))
                                            .cornerRadius(6)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.top, 5)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 290, alignment: .top)
                    .background(.black)
                }
                .transition(.move(edge: .bottom))
                .animation(.easeInOut, value: vm.triger)
                .zIndex(2)
            }
        }
        .onAppear {
            setTabViewBackground()
        }
        .id(selectedTag)
    }
 
    
    func pushButton(value: KeyboardValue) {
        if value.number == nil && value.simbol == nil {
            switch vm.focus {
            case .timer : vm.timer.removeLast()
            case .Investment :
                var temp: String = vm.investment.replacingOccurrences(of: ",", with: "")
                if temp.count > 1 {
                    temp.removeLast()
                    let tempInt: Int = Int(temp)!
                    let t = formatNumberToThousand(number: tempInt)
                    vm.investment = String(t)
                }
            case .none:
                break
            }
        } else {
            if value.number == nil {
                return
            } else {
                switch vm.focus {
                case .timer :
                    vm.timer += String(describing: value.number!)
                    
                case .Investment :
                    var temp: String = vm.investment.replacingOccurrences(of: ",", with: "")
                    temp += String(describing: value.number!)
                    let tempInt: Int = Int(temp)!
                    
                    if tempInt < 10001 {
                        let t = formatNumberToThousand(number: tempInt)
                        vm.investment = String(t)
                    }
                case .none:
                    break
                }
            }
        }
    }
    
    func formatNumberToThousand(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = ","
        let formattedNumber = numberFormatter.string(from: NSNumber(value: number))
        return formattedNumber ?? ""
    }
    
    func setTabViewBackground() {
        tabBar.backgroundColor = UIColor(hex: 0x333749)
        tabBar.barTintColor = selectedTag == 1 ? UIColor(hex: 0x333749) : UIColor(hex: 0x333749)
    }
}


//extension UITabBar {
//    override open func sizeThatFits(_ size: CGSize) -> CGSize {
//        var sizeThatFits = super.sizeThatFits(size)
//        sizeThatFits.height = 90 // adjust your size here
//        return sizeThatFits
//    }
//}

#Preview {
    MainView()
}
