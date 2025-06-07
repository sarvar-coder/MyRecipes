//
//  OffsetModifier.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 05/06/25.
//

import SwiftUI

struct OffsetModifier: ViewModifier {
    
    @Binding var offset: CGFloat
    @State private var startOffset: CGFloat = 0
    
    func body(content: Content) -> some View {
        
        content
            .overlay (
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: OffsetKeys.self, value: proxy.frame(in: .global).minY)
                }
            )
            .onPreferenceChange(OffsetKeys.self) { offset in
                if startOffset == 0 { startOffset = offset}
                self.offset = offset - startOffset
//                print(offset)
            }
    }
}



struct OffsetKeys: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        defaultValue = nextValue()
    }
}
