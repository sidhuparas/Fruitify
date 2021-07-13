//
//  BenefitsView.swift
//  Fruitify
//
//  Created by Paras Sidhu on 30/06/21.
//

import SwiftUI

struct BenefitsView: View {
    var items: [GridItem] {
        Array(repeating: .init(.flexible()), count: 2)
    }
    
    var benefits: Array<String>
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(benefits.prefix(2), id: \.hashValue) { str in
                BenefitRow(text: str)
            }
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        }
    }
}

struct BenefitsView_Previews: PreviewProvider {
    static var previews: some View {
        BenefitsView(benefits: ["Test", "Sidhu"])
    }
}
