//
//  TitleView.swift
//  Fruitify
//
//  Created by Paras Sidhu on 01/07/21.
//

import SwiftUI

struct TitleView: View {
    var shuffleClick: () -> Void
    
    var body: some View {
        HStack {
            Text("Fruitify")
                .font(.system(size: 40))
                .padding()
            
            Spacer()
            
            Button(action: shuffleClick, label: {
                Image(systemName: "shuffle")
                    .font(.system(size: 30))
                    .padding()
            })
            .buttonStyle(BorderlessButtonStyle())
            .frame(width: 100, height: 100)
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(shuffleClick: { })
    }
}
