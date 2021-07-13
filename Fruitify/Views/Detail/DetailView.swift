//
//  DetailView.swift
//  Fruitify
//
//  Created by Paras Sidhu on 01/07/21.
//

import SwiftUI
import URLImage

struct DetailView: View {
    var fruit: FruitData
    
    @State private var showConfetti = false
    @ObservedObject var viewModel: ImageViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                FruitBanner(fruit: fruit)
                Text(fruit.name)
                    .font(.largeTitle)
                    .shadow(radius: 2)
                
                Text(fruit.description)
                    .font(.title2)
                    .padding()
                
                DetailBenefitView(fruit: fruit)
            }
        }
        .ignoresSafeArea()
        .overlay(
            AsyncView(
                source: viewModel,
                loading: { EmptyView() },
                errorView: { EmptyView() }
            ) { cgImage in
                EmitterView(fruit: fruit, cgImage: cgImage)
                    .opacity(showConfetti ? 1 : 0)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1)) {
                            showConfetti = true
                        }
                        hideConfettiWithDelay()
                    }
            }
            .ignoresSafeArea()
        )
        .allowsHitTesting(false)
    }
    
    func hideConfettiWithDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(.linear) {
                showConfetti = false
            }
        }
    }
    
    struct DetailView_Previews: PreviewProvider {
        static var fruit = ModelData().fruitResponse.data.randomElement()!
        static var viewModel = ImageViewModel(url: fruit.image)
        
        static var previews: some View {
            DetailView(fruit: fruit, viewModel: viewModel)
        }
    }
}
