//
//  AlbumView.swift
//  Bad Custer
//
//  Created by Phillip Giammattei on 7/13/20.
//  Copyright © 2020 Phil Giammattei. All rights reserved.
//

import SwiftUI

struct AlbumView: View {
    let album: Album
    var albumID: Int {
        album.id
    }
    var imageName: String {
        album.cover
    }
    var albumTitle: String {
        album.name
    }
    
    var body: some View {
        VStack(alignment: .leading) {
                AlbumImage(imageName: imageName)
                Text(albumTitle)
                .font(.headline)
                .fontWeight(.light)
            }
        
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AlbumView(album: AlbumList().albums[0])
        }
        
    }
}
