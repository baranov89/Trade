//
//  CurrencyPairView.swift
//  Trade
//
//  Created by Алексей Баранов on 20.10.2023.
//

import SwiftUI

struct CurrencyPairView: View {
    @ObservedObject var vm = CurrencyPairViewModel()
    @Binding var pair: String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var backButton : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .font(.system(size: 22))
                .foregroundColor(.white)
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                ForEach(vm.array, id: \.self) { pair in
                    HStack {
                        ForEach(pair, id:  \.self) { item in
                            Text(item)
                                .foregroundColor(.white)
                                .frame(width: 140, height: 54)
                                .background(self.pair == item ? Color(hex: 0x35B972) : Color(hex: 0x333749))
                                .cornerRadius(10)
                                .padding(.horizontal, 5)
                                .onTapGesture {
                                    self.pair = item
                                }
                        }
                        .padding(.bottom, 10)
                    }
                }
            }
            Spacer()
            HStack {
                
            }
            .frame(width: UIScreen.main.bounds.width, height: 110)
            .background(Color(hex: 0x333749))
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color(hex: 0x1E2131, alpha: 1))
        .navigationTitle("Currency pair")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .navigationBarColor(backgroundColor: .clear, titleColor: .white)
        
    }
}

struct NavigationBarModifier: ViewModifier {

    var backgroundColor: UIColor?
    var titleColor: UIColor?

    init(backgroundColor: UIColor?, titleColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

extension View {

    func navigationBarColor(backgroundColor: UIColor?, titleColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }

}

#Preview {
    CurrencyPairView(pair: .constant("GBP/USD"))
}
