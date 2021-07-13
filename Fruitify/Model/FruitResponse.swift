//
//  FruitData.swift
//  Fruitify
//
//  Created by Paras Sidhu on 28/06/21.
//

import Foundation

struct FruitResponse: Codable {
    var data: [FruitData]
}

struct FruitData: Codable {
    var id: Int
    var name: String
    var color1: String
    var color2: String
    var benefits: [String]
    var image: String
    var description: String
}
