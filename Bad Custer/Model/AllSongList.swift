//
//  AllSongList.swift
//  Bad Custer
//
//  Created by Phillip Giammattei on 7/26/20.
//  Copyright © 2020 Phil Giammattei. All rights reserved.
//

import Foundation

class AllSongList: Codable, Identifiable {
    let allSongs: [Song]
    
    init() {
        allSongs = Bundle.main.decode([Song].self, from: "songlist.json")
    }
    
    func getSongsByAlbum(from album: Album) -> [Song] {
        var albumSongs = [Song]()
        allSongs.forEach { song in
            if album.name == song.album {
                albumSongs.append(song)
            }
        }
        
        return albumSongs
    }
}
