//
//  PostService.swift
//  MVVM-Network
//
//  Created by VBT on 28.01.2024.
//

import Foundation

class HomeService {
    
    func fetchAllPosts(completion:@escaping (Result<PostModel, NetworkError>) -> Void){
        NetworkManager.shared.request(endPoint: NetworkEnpoints.posts.rawValue, method: .get, responseType: PostModel.self) {(result: Result<PostModel, NetworkError>) in
            switch result {
            case .success(let data):
                print("istek başarılı:", data)
                completion(.success(data))
            case .failure(let error):
                // Hata durumu
                print("Hata:", error)
                completion(.failure(error))
            }
        }
    }
}
