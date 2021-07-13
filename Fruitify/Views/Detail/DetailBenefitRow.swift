//
//  DetailBenefitRow.swift
//  Fruitify
//
//  Created by Paras Sidhu on 07/07/21.
//

import SwiftUI

struct DetailBenefitRow: View {
    var fruit: FruitData
    var benefit: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 25, height: 25)
                .shadow(radius: 2)
                .padding()
            
            Text(benefit)
                .foregroundColor(.white)
                .font(.system(size: 24))
                .shadow(radius: 2)
                .padding()
            
            Spacer()
        }
        .background(Utils.getFruitGradient(fruit: fruit))
        .cornerRadius(10)
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
        .shadow(radius: 4)
    }
}

struct DetailBenefitRow_Previews: PreviewProvider {
    static var element = ModelData().fruitResponse.data.randomElement()!
    
    static var previews: some View {
        DetailBenefitRow(fruit: element, benefit: element.benefits[0])
    }
}
