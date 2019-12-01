//
//  ContentView.swift
//  WKWebViewUI
//
//  Created by James Stewart on 11/28/19.
//  Copyright © 2019 James Stewart. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let menus = [(WebView(request: URLRequest(url: URL(string: "https://www.apple.com" )!)), Text("Apple")),
                 (WebView(request: URLRequest(url: URL(string: "https://www.google.com")!)), Text("Google")),
                 (WebView(request: URLRequest(url: URL(string: "https://www.amazon.com")!)), Text("Amazon"))]
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: WebView(request: URLRequest(url: URL(string: "https://www.apple.com" )!))) { Text("Apple") }
                NavigationLink(destination: WebView(request: URLRequest(url: URL(string: "https://www.google.com" )!))) { Text("Google") }
                NavigationLink(destination: WebView(request: URLRequest(url: URL(string: "https://www.amazon.com" )!))) { Text("Amazon") }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(request: URLRequest(url: URL(string: "https://www.apple.com")!))
    }
}
