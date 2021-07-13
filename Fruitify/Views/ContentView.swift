//
//  ContentView.swift
//  Fruitify
//
//  Created by Paras Sidhu on 28/06/21.
//

import SwiftUI

struct ContentView: View {
    private var fruitResponse: FruitResponse
    @State var fruit: FruitData
    
    init(fruitResponse: FruitResponse) {
        fruit = fruitResponse.data.randomElement()!
        self.fruitResponse = fruitResponse
    }
    
    var body: some View {
        HStack {
            NavigationView {
                ScrollView {
                    TitleView {
                        fruit = fruitResponse.data.randomElement()!
                    }
                    
                    NavigationLink(destination: DetailView(fruit: fruit, viewModel: ImageViewModel(url: fruit.image))) {
                        FeaturedFruit(fruit: fruit)
                    }
                    .listRowInsets(EdgeInsets())
                    .buttonStyle(PlainButtonStyle())
                    
                    FruitGrid(fruitResponse: fruitResponse)
                        .listRowInsets(EdgeInsets())
                }
                .navigationBarHidden(true)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var response = ModelData().fruitResponse
    
    static var previews: some View {
        ContentView(fruitResponse: response)
    }
}
