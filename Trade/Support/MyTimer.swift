//
//  MyTimer.swift
//  Trade
//
//  Created by Алексей Баранов on 22.10.2023.
//

import Foundation
import Combine

class MyTimer {
    var interval: CGFloat
    let currentTimePublisher: Timer.TimerPublisher?
    let cancellable: AnyCancellable?

    init(interval: CGFloat) {
        self.interval = interval
        self.currentTimePublisher = Timer.TimerPublisher(interval: interval, runLoop: .main, mode: .default)
        self.cancellable = currentTimePublisher!.connect() as? AnyCancellable
    }

    deinit {
        self.cancellable?.cancel()
    }
}
