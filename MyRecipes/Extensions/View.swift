//
//  View.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 05/06/25.
//

import SwiftUI

extension View {
    
    func getScreenBound() -> CGRect {
        UIScreen.main.bounds
    }
    
    func getSafeArea() -> UIEdgeInsets {
        let null = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return null }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else { return null
            }
        return safeArea
    }
}
