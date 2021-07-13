//
//  AsyncView.swift
//  Fruitify
//
//  Created by Paras Sidhu on 08/07/21.
//

import Foundation
import SwiftUI

struct AsyncView<Source: LoadableObject, LoadingView: View, ErrorView: View, Content: View>: View {
    @ObservedObject var source: Source
    var loading: () -> LoadingView
    var errorView: () -> ErrorView
    var content: (Source.Output) -> Content
    
    var body: some View {
        switch source.state {
        case .loading:
            loading()
        case .failed(let error):
            errorView()
        case .loaded(let output):
            content(output)
        }
    }
}
