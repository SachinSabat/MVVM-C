//
//  APIRequestModel.swift
//  Upstox
//
//  Created by Sachin Sabat on 24/02/23.
//

import Foundation

struct APIRequestModel: APIModelProtocol {
    var api: APIConfigurations
    var params: [String: Any]?

    init(api: APIConfigurations, parameters: [String: Any]? = nil) {
        self.api = api
        self.params = parameters
    }
}
