//
//  ImageViewModel.swift
//  Fruitify
//
//  Created by Paras Sidhu on 08/07/21.
//

import Foundation
import SwiftUI
import URLImage
import Alamofire

class ImageViewModel: LoadableObject {
    
    @Published private(set) var state = LoadingState<CGImage>.loading
    private var url = ""
    
    init(url: String) {
        self.url = url
        load()
    }
    
    func load() {
        let request = AF.request(URL(string: url)!)
        request.responseData { (data) in
            if data.data != nil {
                let image = Utils.resizeImage(
                    image: UIImage(data: data.data!)!,
                    targetSize: CGSize(width: 150, height: 150)
                )
                
                DispatchQueue.main.async {
                    self.state = LoadingState.loaded((image?.cgImage!)!)
                }
            }
        }
    }
}
