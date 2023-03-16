//
//  NetworkServiceProtocols.swift
//  Upstox
//
//  Created by Sachin Sabat on 24/02/23.
//

import Foundation

/// Contains necessary methods to generate `URLRequest`
protocol APIConfigurations {
    func getHTTPMethod() -> HTTPMethod
    func getAPIPath() -> String
    func getAPIBasePath() -> String
    func getHeaders() -> [String: String]
}

// All data request adds here
// downloadRequest and uploadRequest
protocol NetworkService {
    @discardableResult func dataRequest<T: Decodable>(_ endPoint: APIRequestModel, objectType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) -> URLSessionDataTask
}

protocol APIModelProtocol {
    var api: APIConfigurations { get set }
    
    /// Post request body parameters
    var params: [String: Any]? { get set }
}

// Types of HTTP methods
enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
}

// Parsing and sending request from API
enum NetworkError: Swift.Error {
    case incorrectData(Data)
    case incorrectURL
    case unknown
}
