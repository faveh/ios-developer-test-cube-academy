//
//  ThemeSettings.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 11/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation


class ThemeSettings {
    static let shared = ThemeSettings()
        
    private init() {}
    
    var cornerRadius: CGFloat = 0
    var buttonHeight: CGFloat = 50
    
    var authToken: String? = {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject],
           let authToken = dict["AuthToken"] as? String {
            // Use authToken
            return authToken
        }
        return nil
    }()
}
