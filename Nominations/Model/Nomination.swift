//
//  Nomination.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 12/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

struct Nomination: Codable, Hashable, Identifiable {
    let id: String
    let nomineeID: String
    let reason: String
    let process: String
    let dateSubmitted: String
    let closingDate: String
    
    enum CodingKeys: String, CodingKey {
        case id = "nomination_id"
        case nomineeID = "nominee_id"
        case reason
        case process
        case dateSubmitted = "date_submitted"
        case closingDate = "closing_date"
    }
}


struct NominationResponse: Codable {
    let nomineeID: String?
    let reason: String?
    let process: String?
    
    enum CodingKeys: String, CodingKey {
        case nomineeID = "nominee_id"
        case reason
        case process
    }
}

struct DeleteNominationResponse: Codable {
    let data: String
}

struct SingleNominationResponse: Codable {
    let data: Nomination
}
