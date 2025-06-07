//
//  CustomCorner.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 05/06/25.
//

import SwiftUI

struct CustomCorner: Shape {

    var corners: UIRectCorner
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
