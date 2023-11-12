//
//  NominationService.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 12/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Combine
import Foundation

protocol NominationServiceProtocol {
    func getNominations(from endpoint: APIEndpoints) -> AnyPublisher<NominationsResponse, NetworkError>
    func nominate(from endpoint: APIEndpoints) -> AnyPublisher<NominationResponse, NetworkError>
    func getNomination(from endpoint: APIEndpoints) -> AnyPublisher<Nomination, NetworkError>
    func updateNomination(from endpoint: APIEndpoints) -> AnyPublisher<NominationResponse, NetworkError>
    func deleteNomination(from endpoint: APIEndpoints) -> AnyPublisher<DeleteNominationResponse, NetworkError>
    func getNominee(from endpoint: APIEndpoints) -> AnyPublisher<NomineesResponse, NetworkError>
}

class NominationService: BaseService, NominationServiceProtocol {
    /// This method retrieves all nominations from a given API endpoint.
    func getNominations(from endpoint: APIEndpoints) -> AnyPublisher<NominationsResponse, NetworkError> {
        return sendRequest(endpoint: endpoint)
    }
    
    /// This method retrieves a single nomination from a given API endpoint.
    func getNomination(from endpoint: APIEndpoints) -> AnyPublisher<Nomination, NetworkError> {
        return sendRequest(endpoint: endpoint)
    }
    
    /// This method updates a nomination at a given API endpoint.
    func updateNomination(from endpoint: APIEndpoints) -> AnyPublisher<NominationResponse, NetworkError> {
        return sendRequest(endpoint: endpoint)
    }
    
    /// This method deletes a nomination at a given API endpoint.
    func deleteNomination(from endpoint: APIEndpoints) -> AnyPublisher<DeleteNominationResponse, NetworkError> {
        return sendRequest(endpoint: endpoint)
    }
    
    /// This method retrieves all nominees from a given API endpoint.
    func getNominee(from endpoint: APIEndpoints) -> AnyPublisher<NomineesResponse, NetworkError> {
        return sendRequest(endpoint: endpoint)
    }

    /// Sends a nomination to the specified API endpoint
    func nominate(from endpoint: APIEndpoints) -> AnyPublisher<NominationResponse, NetworkError> {
        return sendRequest(endpoint: endpoint)
    }
}
