//
//  FruitBanner.swift
//  Fruitify
//
//  Created by Paras Sidhu on 07/07/21.
//

import SwiftUI

struct FruitBanner: View {
    
    var fruit: FruitData
    
    var body: some View {
        HStack {
            Spacer()
            FruitImage(fruit: fruit)
                .frame(width: 200, height: 200)
            Spacer()
        }
        .frame(height: 300)
        .background(Utils.getFruitGradient(fruit: fruit))
    }
}

struct FruitBanner_Previews: PreviewProvider {
    
    static var modelData = ModelData()
    
    static var previews: some View {
        FruitBanner(fruit: modelData.fruitResponse.data.randomElement()!)
    }
}
