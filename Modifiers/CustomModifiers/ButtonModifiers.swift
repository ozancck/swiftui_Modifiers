//
//  ButtonModifiers.swift
//  Modifiers
//
//  Created by Ozan Çiçek on 23.07.2024.
//

import Foundation
import SwiftUI


enum ButtonStyleType {
    case primary
    case secondary
    case danger
    
    var fontStyle: TextFontStyle {
        switch self {
        case .primary:
            return .H1Bold
        case .secondary:
            return .H1Medium
        case .danger:
            return .H1Bold
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .primary:
            return Color.blue
        case .secondary:
            return Color.gray
        case .danger:
            return Color.red
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .primary, .secondary:
            return Color.white
        case .danger:
            return Color.white
        }
    }
    
    var cornerRadius: CGFloat {
        return 10
    }
}

struct CustomButtonModifier: ViewModifier {
    var style: ButtonStyleType
    
    @State private var isPressed: Bool = false

    func body(content: Content) -> some View {
        content
            .textFontStyle(style.fontStyle)
            .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
            .background(style.backgroundColor)
            .foregroundColor(style.foregroundColor)
            .cornerRadius(style.cornerRadius)
            .opacity(isPressed ? 0.7 : 1.0)
            .scaleEffect(isPressed ? 0.95 : 1.0)
            .animation(.easeOut(duration: 0.2), value: isPressed)
            /* ios 17
             
            .onChange(of: isPressed) { newValue in
                print("ozan")
            }
             */
            .onLongPressGesture(minimumDuration: 0.1, pressing: { pressing in
                self.isPressed = pressing
            }, perform: {})
         
    }
}

extension View {
    func customButtonStyle(_ style: ButtonStyleType) -> some View {
        self.modifier(CustomButtonModifier(style: style))
    }
}
