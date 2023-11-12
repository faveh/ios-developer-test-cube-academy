//
//  AuthManager.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 12/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation


final class AuthManager {
    static let shared: AuthManager = AuthManager()

    func getAuthToken() -> String? {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject],
           let authToken = dict["AuthToken"] as? String {
            // Use authToken
            return authToken
        }
        return nil
    }
}
