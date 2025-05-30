//
//  TextView.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 30/05/25.
//

import Foundation
import SwiftUI


struct TextView: UIViewRepresentable {
    
    let text: String
    func makeUIView(context: Context) -> some UITextView {
        return UITextView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        uiView.text = text
        uiView.font = UIFont(name: .roboto(.light), size: 18)
        uiView.textColor = .black
        uiView.isEditable = false
        uiView.isScrollEnabled = true
        uiView.textAlignment = .center
        
    }
}
