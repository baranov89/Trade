//
//  TradeViewModel.swift
//  Trade
//
//  Created by Алексей Баранов on 20.10.2023.
//

import Foundation

class TradeViewModel: ObservableObject {
    @Published var triger: Bool = false
    @Published var focus: FocusEnum?
    @Published var timer: String = "01:05"
    @Published var investment: String = "1,000"
    @Published var balance: Int = 10000
    @Published var htmlPath = Bundle.main.path(forResource: "EURUSD", ofType: "html")
    @Published var alertTriget = false
    
    var array: [[KeyboardValue]] = [
        [KeyboardValue(number: 1, simbol: nil), KeyboardValue(number: 2, simbol: "ABC"), KeyboardValue(number: 3, simbol: "DEF")],
        [KeyboardValue(number: 4, simbol: "GHI"), KeyboardValue(number: 5, simbol: "JKL"), KeyboardValue(number: 6, simbol: "MNO")],
        [KeyboardValue(number: 7, simbol: "PQRS"), KeyboardValue(number: 8, simbol: "TUV"), KeyboardValue(number: 9, simbol: "WXYZ")],
        [KeyboardValue(number: nil, simbol: "TUV"), KeyboardValue(number: 0, simbol: "TUV"), KeyboardValue(number: nil, simbol: nil)]
    ]
    
    func getHtmlPath(pair: String) -> String? {
        var htmlPath: String? = ""
        let temp = pair.replacingOccurrences(of: "/", with: "")
        htmlPath = Bundle.main.path(forResource: temp, ofType: "html")
        return htmlPath
    }
}
