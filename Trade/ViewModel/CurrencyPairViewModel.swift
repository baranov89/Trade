//
//  CurrencyPairViewModel.swift
//  Trade
//
//  Created by Алексей Баранов on 21.10.2023.
//

import Foundation

class CurrencyPairViewModel: ObservableObject {
    @Published var array: [[String]] = [
        ["EUR/USD", "GBP/USD"],
        ["EUR/CAD", "USD/CAD"],
        ["AUD/USD", "NZD/USD"],
        ["EUR/AUD", "CHF/JPY"],
        ["CAD/JPY", "EUR/PLN"],
        ["USD/THB", "AUD/JPY"],
        ["EUR/CHF", "CHF/PLN"],
    ]
}
