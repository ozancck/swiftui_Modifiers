//
//  TextModifiers.swift
//  Modifiers
//
//  Created by Ozan Çiçek on 23.07.2024.
//

import Foundation
import SwiftUI

enum TextFontStyle {
    case H1Bold
    case H1Medium
    case H1Light
    
    
    var font: Font {
        switch self {
        case .H1Bold:
            return Font.custom("Helvetica Neue Bold", size: 24)
        case .H1Medium:
            return Font.custom("Helvetica Neue Medium", size: 24)
        case .H1Light:
            return Font.custom("Helvetica Neue Light", size: 24)
        }
    }
    
}

struct TextFontModifier: ViewModifier {
    var style: TextFontStyle

    func body(content: Content) -> some View {
        content
            .font(style.font)

    }
}

extension View {
    func textFontStyle(_ style: TextFontStyle) -> some View {
        self.modifier(TextFontModifier(style: style))
    }
}
