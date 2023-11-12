//
//  UIDevice.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 12/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import SwiftUI

extension UIDevice {
    var hasNotch: Bool {
        var bottom : CGFloat = 0.0
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        if let keywindowUnWrapped = keyWindow {
            bottom = keywindowUnWrapped.safeAreaInsets.bottom
        }
        return bottom > 0
    }
}
