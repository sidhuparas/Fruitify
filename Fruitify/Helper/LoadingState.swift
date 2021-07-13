//
//  LoadingState.swift
//  Fruitify
//
//  Created by Paras Sidhu on 08/07/21.
//

import Foundation

enum LoadingState<Value> {
    case loading
    case failed(Error)
    case loaded(Value)
}
