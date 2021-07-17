//
//  ModelData.swift
//  Fruitify
//
//  Created by Paras Sidhu on 28/06/21.
//

import Foundation
import SwiftUI

final class ModelData: ObservableObject {
    @Published var fruitResponse: FruitResponse = load("data.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Could not find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename)")
    }
}
