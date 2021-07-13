//
//  ImageViewModel.swift
//  Fruitify
//
//  Created by Paras Sidhu on 08/07/21.
//

import Foundation
import SwiftUI
import URLImage

class ImageViewModel: LoadableObject {
    
    @Published private(set) var state = LoadingState<CGImage>.loading
    private var url = ""
    
    init(url: String) {
        self.url = url
        load()
    }
    
    func load() {
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            if let data = data, data.count > 0 {
                let image = Utils.resizeImage(image: UIImage(data: data)!, targetSize: CGSize(width: 150, height: 150))
                DispatchQueue.main.async {
                    self.state = LoadingState.loaded((image?.cgImage!)!)
                }
            }
            
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }.resume()
    }
}
