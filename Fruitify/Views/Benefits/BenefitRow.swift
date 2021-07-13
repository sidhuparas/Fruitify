//
//  BenefitRow.swift
//  Fruitify
//
//  Created by Paras Sidhu on 30/06/21.
//

import SwiftUI

struct BenefitRow: View {
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.seal")
                .frame(width: 20, height: 20)
                .shadow(radius: 5)
            
            Text(text)
                .shadow(radius: 5)
                .foregroundColor(.white)
        }
    }
}

struct BenefitRow_Previews: PreviewProvider {
    static var previews: some View {
        BenefitRow(text: "Hey")
    }
}
