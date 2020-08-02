//
//  SongList.swift
//  Bad Custer
//
//  Created by Phillip Giammattei on 7/26/20.
//  Copyright © 2020 Phil Giammattei. All rights reserved.
//

import SwiftUI

struct SongList: View {
    let currentAlbum: Album
    
    let albumList = AlbumList().albums
    let allSongList = AllSongList()
    
    var currentSongList: [Song] {
        var songs = [Song]()
        allSongList.allSongs.forEach { song in
            if song.album == currentAlbum.name {
                songs.append(song)
            }
        }
        
        return songs
    }
    
    var body: some View {
        VStack {
            AlbumView(album: currentAlbum)
            List {
                ForEach(currentSongList) { song in
                    NavigationLink(destination: NowPlaying(album: self.currentAlbum)) {
                        Text(song.title)
                    }
                }
            }
        }
        .navigationBarTitle(Text(currentAlbum.name))
    }
}

struct SongList_Previews: PreviewProvider {
    static var previews: some View {
        SongList(currentAlbum: AlbumList().albums[0])
    }
}
