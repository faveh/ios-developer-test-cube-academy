//
//  APIBuilder.swift
//  Nominations
//
//  Created by Ayodimeji Adejuwon on 12/11/2023.
//  Copyright © 2023 3 Sided Cube (UK) Ltd. All rights reserved.
//

import Foundation
enum RequestMethod: String {
    case GET
    case POST
    case DELETE
    case PUT
}

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseURL: String { get }
    var path: String { get }
}

enum HeaderFields {
    static let contentType = "Content-type"
    static let authorization = "Authorization"
    static let applicationJson = "application/json"
}

extension APIBuilder {
    var baseURL: String {
        return Constants.baseURL
    }
    
    private func addAuthToken(request: inout URLRequest) {
        if let token = AuthManager.shared.getAuthToken() {
            request.addValue("Bearer \(token)", forHTTPHeaderField: HeaderFields.authorization)
        }
    }
    
    /**
    Constructs and returns a URLRequest object based on the provided parameters.

    - Parameter query: A string representing the query parameters to be appended to the URL. Default is an empty string.
    - Parameter method: The HTTP method for the request (e.g., GET, POST, etc.). Default is GET.
    - Parameter requestPath: The specific path in the API that the request should be made to.

    - Returns: A URLRequest object configured with the provided parameters.

    - Note: This function will add the currently authenticated user's token to the request's headers if it's available.
    */
    func makeRequest(query: String = "", method: RequestMethod = .GET, requestPath: String) -> URLRequest {
        guard let url = URL(string: self.baseURL+requestPath+query) else {
            fatalError("Invalid URL")
        }
            
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue(HeaderFields.applicationJson, forHTTPHeaderField: HeaderFields.contentType)
            
        self.addAuthToken(request: &request)
            
        return request
    }
        
    /**
    Constructs and returns a URLRequest object based on the provided parameters and request body.

    - Parameter requestBody: An object conforming to the Codable protocol that will be encoded into JSON and set as the request's HTTP body.
    - Parameter query: A string representing the query parameters to be appended to the URL. Default is an empty string.
    - Parameter method: The HTTP method for the request (e.g., GET, POST, etc.).
    - Parameter requestPath: The specific path in the API that the request should be made to.

    - Returns: A URLRequest object configured with the provided parameters and request body.

    - Note: This function will add the currently authenticated user's token to the request's headers if it's available.
    */
    func makeRequest<T: Codable>(requestBody: T, query: String = "", method: RequestMethod, requestPath: String) -> URLRequest {
        guard let url = URL(string: self.baseURL + requestPath + query) else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue(HeaderFields.applicationJson, forHTTPHeaderField: HeaderFields.contentType)
        
        do {
            let jsonData = try JSONEncoder().encode(requestBody)
            request.httpBody = jsonData
        } catch {
            print("Failed to encode requestBody: \(error)")
        }
        
        addAuthToken(request: &request)
        
        return request
    }
}
