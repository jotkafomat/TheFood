//
//  HtmlView.swift
//  TheFood
//
//  Created by Krzysztof Jankowski on 06/06/2021.
//

import SwiftUI
import WebKit

struct HtmlView: UIViewRepresentable {
    let html: String

    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.ignoresViewportScaleLimits = true
        let view = WKWebView(frame: .zero, configuration: configuration)
        view.pageZoom = 2
        view.scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: view.scrollView.contentSize.height)
        return view
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(html, baseURL: nil)
    }
}
