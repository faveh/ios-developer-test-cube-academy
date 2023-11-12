//
//  StickyButtonView.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 11/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

enum StickyButtonType {
    case unStackedPrimary
    case unStackedSecondary
    case verticalStack
    case horizontalStack
}

struct StickyButtonView: View {
    var primaryName: String?
    var secondaryName: String?

    var buttonType: StickyButtonType

    var primaryState: ButtonState
    var secondaryState: ButtonState?
    var isWarningPage: Bool = false

    var primaryAction: () -> Void
    var secondaryAction: (() -> Void)?

    var body: some View {
        Rectangle()
            .fill(Color.white)
            .frame(height: buttonType == .verticalStack ? 158 : 92)
            .shadow(.strong)
            .overlay {
                VStack {
                    switch buttonType {
                    case .unStackedPrimary, .unStackedSecondary:
                        createButtonView(name: primaryName, style: buttonType == .unStackedPrimary ? .primary : .secondary, state: primaryState, action: primaryAction)
                    case .verticalStack, .horizontalStack:
                        StackedButtonView(primaryName: primaryName, secondaryName: secondaryName, primaryState: primaryState, secondaryState: secondaryState, primaryAction: primaryAction, secondaryAction: secondaryAction, isHorizontal: buttonType == .horizontalStack, isWarningPage: isWarningPage)
                    }
                }
                .padding(.horizontal, 24)
            }
    }
}

func createButtonView(name: String?, style: ButtonStyle, state: ButtonState?, action: (() -> Void)?) -> some View {
    ButtonView(name: name ?? "", style: style, state: state ?? .active, buttonAction: action ?? {})
}

struct StackedButtonView: View {
    var primaryName: String?
    var secondaryName: String?
    var primaryState: ButtonState
    var secondaryState: ButtonState?
    var primaryAction: () -> Void
    var secondaryAction: (() -> Void)?
    var isHorizontal: Bool
    var isWarningPage: Bool

    var body: some View {
        GeometryReader { geometry in
            if isHorizontal {
                HStack(spacing: 14) {
                    createButtonView(name: secondaryName, style: .secondary, state: secondaryState, action: secondaryAction)
                        .frame(width: geometry.size.width / 3.3)
                    createButtonView(name: primaryName, style: .primary, state: primaryState, action: primaryAction)
                        .frame(width: (geometry.size.width / 3.3) * 2.3)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            } else {
                VStack(spacing: 14) {
                    createButtonView(name: primaryName, style: isWarningPage ? .secondary : .primary, state: primaryState, action: primaryAction)
                    createButtonView(name: secondaryName, style: .secondary, state: secondaryState, action: secondaryAction)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview("Stacked") {
    StickyButtonView(primaryName: "Next", secondaryName: "Back", buttonType: .horizontalStack, primaryState: .active, secondaryState: .inactive, primaryAction: {}, secondaryAction: {})
}

#Preview("Unstacked") {
    StickyButtonView(buttonType: .unStackedSecondary, primaryState: .loading) {}
}
