//
//  FeaturedFruit.swift
//  Fruitify
//
//  Created by Paras Sidhu on 29/06/21.
//

import SwiftUI
import URLImage

func LoadingView() -> some View {
    return Image("loading")
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
}

struct FeaturedFruit: View {
    var fruit: FruitData
    
    var items: [GridItem] {
        Array(repeating: .init(.flexible()), count: 2)
    }
    
    var body: some View {
        HStack {
            BenefitsView(benefits: fruit.benefits)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 10))
            
            Spacer()
            
            FruitImage(fruit: fruit)
                .frame(width: 120, height: 120)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 20))
            
        }
        .background(Utils.getFruitGradient(fruit: fruit))
        .cornerRadius(12)
        .shadow(radius: 5)
        .padding()
    }
}

struct FeaturedFruit_Previews: PreviewProvider {
    static var modelData = ModelData()
    
    static var previews: some View {
        FeaturedFruit(fruit: modelData.fruitResponse.data[1])
    }
}
