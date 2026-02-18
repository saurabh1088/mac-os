//
//  WebView.swift
//  MarkdownViewer
//
//  Created by Saurabh Verma on 18/02/26.
//

import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
    let html: String
    
    func makeNSView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: config)
//        webView.configuration.defaultWebpagePreferences.preferredContentMode = .readable
        return webView
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        // Improved template with dark mode support
        let fullHTML = """
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Markdown</title>
            <style>
                :root {
                    --bg: #ffffff;
                    --text: #1f2328;
                    --code-bg: #f6f8fa;
                }
                @media (prefers-color-scheme: dark) {
                    :root {
                        --bg: #0d1117;
                        --text: #c9d1d9;
                        --code-bg: #161b22;
                    }
                }
                body {
                    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
                    background: var(--bg);
                    color: var(--text);
                    line-height: 1.7;
                    margin: 0;
                    padding: 2rem;
                    max-width: 900px;
                    margin: 0 auto;
                }
                pre, code {
                    background: var(--code-bg);
                    border-radius: 6px;
                }
                pre { padding: 1rem; overflow-x: auto; }
                code { padding: 0.2em 0.4em; font-family: 'SF Mono', Menlo, monospace; }
                h1, h2, h3 { margin-top: 2em; }
                a { color: #0969da; }
                blockquote {
                    border-left: 4px solid #d0d7de;
                    padding-left: 1rem;
                    color: #6e7781;
                }
                @media (prefers-color-scheme: dark) {
                    blockquote { border-left-color: #444d56; color: #8b949e; }
                }
            </style>
        </head>
        <body>
            \(html)
        </body>
        </html>
        """
        
        nsView.loadHTMLString(fullHTML, baseURL: nil)
    }
}

#Preview {
    WebView(html: "")
}
