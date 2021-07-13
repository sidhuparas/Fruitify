//
//  FruitImage.swift
//  Fruitify
//
//  Created by Paras Sidhu on 07/07/21.
//

import SwiftUI
import URLImage

struct FruitImage: View {
    
    var fruit: FruitData
    
    var body: some View {
        URLImage(URL.init(string: fruit.image)!) {
            LoadingView()
        } inProgress: { progress in
            LoadingView()
        } failure: { error, retry in
            
        } content: { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct FruitImage_Previews: PreviewProvider {
    
    static var modelData = ModelData()
    
    static var previews: some View {
        FruitImage(fruit: modelData.fruitResponse.data.randomElement()!)
    }
}
