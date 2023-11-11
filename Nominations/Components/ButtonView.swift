//
//  ButtonView.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 11/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

enum ButtonState {
    case active
    case inactive
    case loading
    case pressed
}

enum ButtonStyle {
    case primary
    case secondary
}

struct ButtonView: View {
    var name: String
    var style: ButtonStyle
    var state: ButtonState
    var buttonAction: () -> Void
    
    var theme: ThemeSettings {
        ThemeSettings.shared
    }
    
    var buttonColor: Color {
        getButtonColor(state, style)
    }
    
    var strokeColor: Color {
        getStrokeColor(state, style)
    }
    
    var textColor: Color {
        getTextColour(state, style)
    }
    
    var body: some View {
        Button(action: buttonAction, label: {
            RoundedRectangle(cornerRadius: theme.cornerRadius)
                .fill(buttonColor)
                .stroke(strokeColor, lineWidth: 2)
                .frame(height: theme.buttonHeight)
                .overlay(
                    Group {
                        switch state {
                        case .loading:
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: textColor))
                        default:
                            Text(name.uppercased())
                                .style(.button)
                                .foregroundColor(textColor)
                        }
                    }
                )
        })
    }
}

extension ButtonView {
    func getButtonColor(_ state: ButtonState, _ style: ButtonStyle) -> Color {
        switch state {
        case .active, .loading:
            return style == .secondary ? Color.white : Color.black
        case .inactive:
            return style == .secondary ? Color.white : Color.cubeMidGrey
        case .pressed:
            return style == .secondary ? Color.white : Color.cubeDarkGrey
        }
    }
    
    func getStrokeColor(_ state: ButtonState, _ style: ButtonStyle) -> Color {
        switch style {
        case .primary:
            return state == .pressed ? Color.black : buttonColor
        case .secondary:
            if state == .pressed {
                return Color.pink
            } else if state == .inactive {
                return Color.cubeMidGrey
            }
            return Color.black
        }
    }
    
    func getTextColour(_ state: ButtonState, _ style: ButtonStyle) -> Color {
        switch style {
        case .primary:
            return Color.white
        case .secondary:
            return state == .inactive ? Color.cubeDarkGrey : Color.black
        }
    }
}

#Preview {
    ButtonView(name: "Primary", style: .secondary, state: .pressed) {
        
    }
}
