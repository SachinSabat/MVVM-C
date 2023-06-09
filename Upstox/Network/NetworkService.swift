//
//  NetworkService.swift
//  Upstox
//
//  Created by Sachin Sabat on 24/02/23.
//

import Foundation

final class NetworkClient: NetworkService, URLRequestConvertible {
    //MARK: Properties
    private let session: URLSession
    
    static var currentSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        configuration.timeoutIntervalForResource = 30
        configuration.waitsForConnectivity = true
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        return URLSession(configuration: configuration)
    }()
    
    //MARK: Initializer
    init(session: URLSession = NetworkClient.currentSession) {
        self.session = session
    }
    
    //MARK: Methods
    func dataRequest<T>(_ endPoint: APIRequestModel, objectType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) -> URLSessionDataTask where T : Decodable {
        var request: URLRequest
        
        request = makeURLRequest(apiModel: endPoint)
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let error = error as NSError?, error.domain == NSURLErrorDomain {
                completion(Result.failure(NetworkError.unknown))
                return
            }
            
            guard let data = data, let _ = response as? HTTPURLResponse else {
                completion(Result.failure(NetworkError.incorrectData(data ?? Data())))
                return
            }
            do {
                let jsonObject = try JSONDecoder().decode(objectType, from: data)
                completion(Result.success(jsonObject))
            } catch {
                completion(Result.failure(NetworkError.unknown))
            }
        }
        dataTask.resume()
        return dataTask
    }
}

