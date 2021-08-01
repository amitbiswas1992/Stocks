//
//  NetworkManager.swift
//  Stocks
//
//  Created by Amit Biswas on 7/9/21.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init () {}
    
    private struct Constant {
        static let apiKey = "c431puiad3i9eq3upirg"
        static let snadBoxApiKey = "sandbox_c431puiad3i9eq3upis0"
        static let baseUrl = "https://finnhub.io/api/v1/"
    }

    //MARK:- Public

    // search stock


    // get stock info



    //MARK:- Private

    private enum Endpoint: String {
        case search
        
    }

    private enum APIError: String, Error {
        case invalidUrl     = "Invalid url"
        case networkIssue   = "Seems you are not connected with Internet"
        case dataNotFound   = "Data not found"
        case unknown         = "Unknown error "
    }

    private func url(for endpoint: Endpoint, queryParam: [String: String] = [:]) -> URL? {
        
        var urlString = Constant.baseUrl + endpoint.rawValue
        var queryItem = [URLQueryItem]()
        // Add any parameter url
        for (name, value ) in queryParam {
            queryItem.append(.init(name: name, value: value))
        }
        // Add token
        queryItem.append(.init(name: "token", value: Constant.apiKey))
        urlString += "?" +  queryItem.map {"\($0.name) = \($0.value ?? "" )" }.joined(separator: "&")
        
        return URL(string: urlString)
    }

    //MARK:- Generic API call
    private func request<T: Codable>(
        url: URL?,
        expecting: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
        ) {

        guard let url = url else {
            completion(.failure(APIError.invalidUrl))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in

            guard let data = data , error == nil else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(APIError.dataNotFound))
                }
                return
            }

            do {

                let result = try JSONDecoder().decode(expecting, from : data )
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}
