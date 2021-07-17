//
//  LoadableObject.swift
//  Fruitify
//
//  Created by Paras Sidhu on 08/07/21.
//

import Foundation

protocol LoadableObject: ObservableObject {
    associatedtype Output
    var state: LoadingState<Output> { get }
}
