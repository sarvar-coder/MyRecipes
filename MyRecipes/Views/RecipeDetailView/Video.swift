//
//  Video.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 30/05/25.
//

import Foundation
import SwiftUI
import WebKit

struct Video: UIViewRepresentable {
    
    let videoID: String
    
    func makeUIView(context: Context) -> some WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let youTubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
        
        uiView.scrollView.isScrollEnabled = true
        uiView.load(URLRequest(url: youTubeURL))
    }
}
