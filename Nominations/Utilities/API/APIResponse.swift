//
//  APIResponse.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 12/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation


struct ListResponse<T: Codable>: Codable {
    let data: [T]?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

typealias NomineesResponse = ListResponse<Nominee>
typealias NominationsResponse = ListResponse<Nomination>
