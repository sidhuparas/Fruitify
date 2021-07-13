//
//  FruitItem.swift
//  Fruitify
//
//  Created by Paras Sidhu on 28/06/21.
//

import SwiftUI
import URLImage

struct FruitItem: View {
    var fruit: FruitData
    
    func LoadingView() -> some View {
        return Image("loading")
            .resizable()
            .scaledToFit()
    }
    
    var body: some View {
        NavigationLink(destination: DetailView(fruit: fruit, viewModel: ImageViewModel(url: fruit.image))) {
            VStack(alignment: .leading) {
                FruitImage(fruit: fruit)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                
                Text(fruit.name)
                    .shadow(color: .black, radius: 2, x:0, y: 2)
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
            }
            .background(Utils.getFruitGradient(fruit: fruit))
            .cornerRadius(12)
        }
    }
}

struct FruitItem_Previews: PreviewProvider {
    static var fruits = ModelData().fruitResponse.data
    
    static var previews: some View {
        FruitItem(fruit: fruits[0])
    }
}
