//
//  BaseService.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 12/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation
import Combine

class BaseService {
    /// The function `sendRequest` is used to send a network request to a specified endpoint.
    ///
    /// - Parameters:
    ///   - endpoint: The endpoint (URL) to which the request should be sent.
    ///
    /// - Returns: An AnyPublisher that publishes the response data or a NetworkError if the request fails.
    func sendRequest<T: APIBuilder, R: Codable>(endpoint: T) -> AnyPublisher<R, NetworkError> {
        return URLSession.shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in .unknown }
            .flatMap { data, response -> AnyPublisher<R, NetworkError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: .unknown)
                        .eraseToAnyPublisher()
                }
                if (200...299).contains(response.statusCode) {
                    return self.decodeData(data: data, responseType: R.self)
                } else {
                    return self.handleErrorResponse(data: data, statusCode: response.statusCode)
                }
            }.eraseToAnyPublisher()
    }
    
    /// The function `decodeData` is used to decode the given Data into a specified Decodable type.
    ///
    /// - Parameters:
    ///   - data: The Data to be decoded.
    ///   - responseType: The type (which conforms to Decodable) to which the data should be decoded.
    ///
    /// - Returns: An AnyPublisher that publishes the decoded data or a NetworkError if the decoding fails.
    func decodeData<T: Decodable>(data: Data, responseType: T.Type) -> AnyPublisher<T, NetworkError> {
        return Just(data)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { _ in .decodingError }
            .eraseToAnyPublisher()
    }
    
    /// The function `handleErrorResponse` is used to handle error responses from the server.
    ///
    /// - Parameters:
    ///   - data: The response data from the server.
    ///   - statusCode: The status code of the response.
    ///
    /// - Returns: An AnyPublisher that publishes a NetworkError based on the status code and response data.
    func handleErrorResponse<T: Decodable>(data: Data, statusCode: Int) -> AnyPublisher<T, NetworkError> {
        do {
            let errorResponse: ErrorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
            return Fail(error: .custom(errorMessage: errorResponse.error ?? ErrorConstants.error))
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: .errorCode(statusCode)).eraseToAnyPublisher()
        }
    }
}


enum NetworkError: Error {
    case invalidCredentials
    case decodingError
    case errorCode(Int)
    case custom(errorMessage: String)
    case unknown
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
            case .decodingError:
            return ErrorConstants.decodingError
            case .errorCode(let code):
            return "\(code) - \(ErrorConstants.errorCode)"
            case .invalidCredentials:
            return ErrorConstants.invalidCredentials
            case .custom(let message):
            return "\(ErrorConstants.error): \(message)"
            case .unknown:
            return ErrorConstants.unknown
        }
    }
}

struct ErrorResponse: Codable {
    let error: String?
    
    enum CodingKeys: String, CodingKey {
        case error
    }
}
