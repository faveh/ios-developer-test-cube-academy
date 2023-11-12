//
//  APIEndpoints.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 12/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation

struct NominationRequest: Codable {
    var nominee_id: String?
    var reason: String?
    var process: String?
}

enum APIEndpoints {
    case getNominees
    case createNomination(requestBody: NominationRequest)
    case getAllNominations
    case getNomination(nominationID: String)
    case updateNomination(nominationID: String, requestBody: NominationRequest)
    case deleteNomination(nominationID: String)
}

extension APIEndpoints: APIBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .getNominees, .getAllNominations, .getNomination:
            return makeRequest(method: .GET, requestPath: self.path)
        case .createNomination(let requestBody):
            return makeRequest(requestBody: requestBody, method: .POST, requestPath: self.path)
        case .updateNomination(_, requestBody: let requestBody):
            return makeRequest(requestBody: requestBody, method: .PUT, requestPath: self.path)
        case .deleteNomination:
            return makeRequest(method: .DELETE, requestPath: self.path)
        }
    }
    
    var path: String {
        switch self {
        case .getNominees:
            return "/nominee"
        case .createNomination:
            return "/nomination"
        case .getAllNominations:
            return "/nomination"
        case .getNomination(let nominationID), .deleteNomination(let nominationID), .updateNomination(let nominationID, _):
            return "/nomination/\(nominationID)"
        }
    }
}
