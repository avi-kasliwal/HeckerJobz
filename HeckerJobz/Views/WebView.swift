//
//  WebView.swift
//  HeckerJobz
//
//  Created by Avi Kasliwal on 12/09/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var text: String
    var url: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if text != "" {
            uiView.loadHTMLString(text, baseURL: nil)
        } else {
            if let urlString = URL (string: url) {
                let req = URLRequest (url: urlString)
                uiView.load(req)
            }
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(text: "", url: "https://www.google.com")
    }
}
