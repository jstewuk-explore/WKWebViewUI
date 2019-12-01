//
//  WebView.swift
//  WebView
//
//  Created by James Stewart on 11/28/19.
//  Copyright © 2019 James Stewart. All rights reserved.
//

/// References:
/// https://forums.developer.apple.com/thread/117348
/// https://developer.apple.com/tutorials/swiftui/interfacing-with-uikit
/// https://github.com/rhysm94/Browser/blob/master/Browser/WebView.swift
/// [Ultimate Guide](https://www.hackingwithswift.com/articles/112/the-ultimate-guide-to-wkwebview)
/// [Javascript interception](https://developpaper.com/wk-webview-protocol-interception-details-for-ios-and-js-interaction-tutorial/)

import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    
    let request: URLRequest
    let wkWebView = WKWebView()
      
    func makeUIView(context: Context) -> WKWebView  {
        wkWebView
    }
      
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
    
    func makeCoordinator() -> WebView.Coordinator {
         Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        @objc dynamic var wkWebView: WKWebView
        private var observations = [NSKeyValueObservation]()

        init(_ webView: WebView) {
            print("init")
            self.wkWebView = webView.wkWebView
            observations.append(wkWebView.observe(\.estimatedProgress, options: .new) { (webView, change) in
                print(webView.estimatedProgress)
            })
        }
        
        deinit {
            observations = [NSKeyValueObservation]()
        }
    }
      
}
  
#if DEBUG
struct WebView_Previews : PreviewProvider {
    static var previews: some View {
//        WebView(request: URLRequest(url: URL(string: "https://www.apple.com")!))
        WebView(request: URLRequest(url: URL(string: "https://www.google.com")!))

    }
}
#endif
