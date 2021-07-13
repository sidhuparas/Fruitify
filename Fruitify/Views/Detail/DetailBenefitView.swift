//
//  DetailBenefitView.swift
//  Fruitify
//
//  Created by Paras Sidhu on 07/07/21.
//

import SwiftUI

struct DetailBenefitView: View {
    var fruit: FruitData
    
    var body: some View {
        ForEach(fruit.benefits, id: \.hashValue) { benefit in
            DetailBenefitRow(fruit: fruit, benefit: benefit)
        }
    }
}

struct DetailBenefitView_Previews: PreviewProvider {
    static var fruit = ModelData().fruitResponse.data.randomElement()!
    
    static var previews: some View {
        DetailBenefitView(fruit: fruit)
    }
}
