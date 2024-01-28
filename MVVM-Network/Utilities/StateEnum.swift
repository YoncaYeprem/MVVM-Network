//
//  StateEnum.swift
//  MVVM-Network
//
//  Created by VBT on 28.01.2024.
//

import Foundation

enum State {
    case loading
    case completed
    case failure(NetworkError)
}
