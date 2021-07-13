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

func hexStringToUIColor (hex:String) -> Color {
    var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return Color.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return Color(
        red: Double((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: Double((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: Double(rgbValue & 0x0000FF) / 255.0,
        opacity: Double(1.0)
    )
}
