//
//  Nominee.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 12/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

struct Nominee: Codable, Hashable, Identifiable {

    var id: String?
    var firstName: String?
    var lastName: String?

    enum CodingKeys: String, CodingKey {
        case id = "nominee_id"
        case firstName = "first_name"
        case lastName = "last_name"
    }
    
    // get nominee full name
    var fullName: String {
        return "\(firstName ?? "") \(lastName ?? "")"
    }
}
