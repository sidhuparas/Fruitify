//
//  FruitGrid.swift
//  Fruitify
//
//  Created by Paras Sidhu on 29/06/21.
//

import SwiftUI

struct FruitGrid: View {
    var items: [GridItem] {
        Array(repeating: .init(.flexible()), count: 2)
    }
    
    var fruitResponse: FruitResponse
        
    var body: some View {
        LazyVGrid(columns: items) {
            ForEach(fruitResponse.data, id: \.id) { fruit in
                FruitItem(fruit: fruit)
            }
        }
        .padding()
    }
}

struct FruitGrid_Previews: PreviewProvider {
    static var previews: some View {
        FruitGrid(fruitResponse: ModelData().fruitResponse)
    }
}
