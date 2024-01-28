//
//  ViewController.swift
//  MVVM-Network
//
//  Created by VBT on 28.01.2024.
//

import UIKit

class HomeViewController: UIViewController {

    let homeViewModel:HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        //homeService.fetchAllPosts()
        homeViewModel.fetchPost { result in
            switch result {
            case .loading:
                print("show loading")
            case .completed:
                print("reload data \(self.homeViewModel.postList?.count)")
            case .failure:
                print("show error")
            }
        }
    }


}

