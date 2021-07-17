//
//  EmitterView.swift
//  Fruitify
//
//  Created by Paras Sidhu on 08/07/21.
//

import SwiftUI
import URLImage

/*
    Special thanks to Kavsoft. This view is inspired from his tutorial.
    Link: https://www.youtube.com/watch?v=eXc0q714dGg
*/
struct EmitterView: UIViewRepresentable {
    
    var fruit: FruitData
    var cgImage: CGImage?
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterShape = .line
        emitterLayer.emitterCells = createEmitterCells()
        
        emitterLayer.emitterSize = CGSize(width: Utils.getRect().width, height: 1)
        emitterLayer.emitterPosition = CGPoint(x: Utils.getRect().width / 2, y: 0)
        
        view.layer.addSublayer(emitterLayer)
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    func createEmitterCells() -> [CAEmitterCell] {
        let cell = CAEmitterCell()

        cell.contents = cgImage
        cell.birthRate = 6.5
        cell.lifetime = 30
        cell.velocity = 160
        cell.scale = 0.4
        cell.scaleRange = 0.5
        cell.emissionLongitude = .pi
        cell.emissionRange = 0.8
        cell.spin = 3.5
        cell.spinRange = 1
        cell.yAcceleration = 70
        
        return [cell]
    }
}
