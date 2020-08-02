//
//  Albums.swift
//  Bad Custer
//
//  Created by Phillip Giammattei on 7/17/20.
//  Copyright © 2020 Phil Giammattei. All rights reserved.
//

import SwiftUI

struct Music: View {
    let albums = AlbumList().albums
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.9, green: 0.9, blue: 0.9)
                VStack {
                    HStack {
                        Spacer()
                        NavigationLink(destination: SongList(currentAlbum: albums[0])) {
                            AlbumView(album: albums[0])
                        }
                        Spacer()

                        NavigationLink(destination: SongList(currentAlbum: albums[1])) {
                            AlbumView(album: albums[1])
                        }
                        Spacer()

                    }
                    .padding(.top)
                    HStack {
                        Spacer()

                        NavigationLink(destination: SongList(currentAlbum: albums[2])) {
                            AlbumView(album: albums[2])
                        }
                        Spacer()

                        NavigationLink(destination: SongList(currentAlbum: albums[3])) {       AlbumView(album: albums[3])
                        }
                        Spacer()

                    }
                    .padding(.top)
                    Spacer()
                }
               
                .buttonStyle(PlainButtonStyle())
                .navigationBarTitle("Music")
            }
        }
    }
}

struct Albums_Previews: PreviewProvider {
    static var previews: some View {
        Music()
    }
}
