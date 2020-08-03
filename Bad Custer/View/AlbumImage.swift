//
//  AlbumImage.swift
//  Bad Custer
//
//  Created by Phillip Giammattei on 8/2/20.
//  Copyright © 2020 Phil Giammattei. All rights reserved.
//

import SwiftUI

struct AlbumImage: View {
    var imageName: String
    
    var body: some View {
        GeometryReader { geometry in
            Image(self.imageName)
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
                .cornerRadius(5)
                .frame(maxWidth: geometry.size.width)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                .shadow(color: Color.white.opacity(0.7), radius: 5, x: -3, y: -3)
                
        }
    .scaledToFit()
    }
}

struct AlbumImage_Previews: PreviewProvider {
    static var previews: some View {
        AlbumImage(imageName: AlbumList().albums[0].cover)
    }
}
