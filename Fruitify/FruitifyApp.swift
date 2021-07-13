//
//  FruitifyApp.swift
//  Fruitify
//
//  Created by Paras Sidhu on 28/06/21.
//

import SwiftUI
import ActivityIndicatorView

@main
struct FruitifyApp: App {
    @StateObject private var modelData = ModelData()
    @ObservedObject private var viewModel = HomeViewModel()
    @State private var shouldShowLoader = true
    
    var body: some Scene {
        WindowGroup {
            AsyncView(
                source: viewModel,
                loading: {
                    ActivityIndicatorView(isVisible: $shouldShowLoader, type: .scalingDots)
                        .frame(width: 150, height: 150)
                        .foregroundColor(.orange)
                },
                errorView: {
                    EmptyView()
                }
            ) { response in
                ContentView(fruitResponse: response)
                    .scaleEffect()
            }
        }
    }
}
