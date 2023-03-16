//
//  HoldingsAPIs.swift
//  Upstox
//
//  Created by Sachin Sabat on 24/02/23.
//

import Foundation

//URL list
enum UpstoxAPIConstants {
    static var baseURL = "https://run.mocky.io"
    static var homeScreen = "/v3/6d0ad460-f600-47a7-b973-4a779ebbaeaf"
}

// Types of cases to get data
enum UpstoxAPIs {
    case getHomeScreen
}

extension UpstoxAPIs: APIConfigurations {
    func getHTTPMethod() -> HTTPMethod {
        var methodType = HTTPMethod.GET
        switch self {
        case .getHomeScreen:
            methodType = .GET
        }
        return methodType
    }
    
    func getAPIPath() -> String {
        var endPoint = getAPIBasePath()
        switch self {
        case .getHomeScreen:
            endPoint += UpstoxAPIConstants.homeScreen
        }
        return endPoint
    }
    
    func getAPIBasePath() -> String {
        switch self {
        case .getHomeScreen:
            return UpstoxAPIConstants.baseURL
        }
    }
    
    func getHeaders() -> [String: String] {
        var headerDict = [String: String]()
        headerDict["Content-Type"] = "application/json"
        return headerDict
    }
}

