//
//  SwiftUIWebView.swift
//  Trade
//
//  Created by Алексей Баранов on 18.10.2023.
//

import SwiftUI
import WebKit

struct SwiftUIWebView: UIViewRepresentable {
    
    let url : URL?
    func makeUIView(context: Context) -> WKWebView {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        return WKWebView(frame: .zero,
                                configuration: config)
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let myURL = url else {
            return
        }
        let request = URLRequest(url: myURL)
        uiView.load(request)
    }
}

