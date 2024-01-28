//
//  NetworkManager.swift
//  MVVM-Network
//
//  Created by VBT on 28.01.2024.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let baseURL = "https://jsonplaceholder.typicode.com";
    
    func request<T: Decodable>(endPoint: String, method:HTTPMethod,queryParams: [String:Any]? = nil, requestModel: Encodable? = nil, responseType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        guard let url = URL(string: baseURL + endPoint) else { return completion(.failure(.invalidEndpoint)) }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = queryParams?.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        
        guard let finalURL = urlComponents?.url else { return }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        
        if let requestModel = requestModel {
            do {
                let encoder = JSONEncoder()
                request.httpBody = try encoder.encode(requestModel)
            } catch {
                completion(.failure(.serializationError))
                return
            }
        }
        
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil else { return completion(.failure(.requestFailed)) }
            
            guard let data = data, let responseData = try? JSONDecoder().decode(T.self, from: data) else { return completion(.failure(.fetchError)) }
            
            DispatchQueue.main.async {
                completion(.success(responseData))
            }
        }
        session.resume()
    }
    
}
