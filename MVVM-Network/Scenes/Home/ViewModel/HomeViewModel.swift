//
//  HomeViewModel.swift
//  MVVM-Network
//
//  Created by VBT on 28.01.2024.
//

import Foundation


class HomeViewModel {
    let homeService: HomeService = HomeService()
    
    var postList: PostModel?
    
    func fetchPost(completion: ((_ state: State) -> ())?){
        DispatchQueue.main.async {
            completion?(.loading)
            self.homeService.fetchAllPosts { result in
                switch result {
                case .success(let data):
                    self.postList = data
                    completion?(.completed)
                case .failure(let error):
                    completion?(.failure(error))
                }
            }
        }
    }
}
