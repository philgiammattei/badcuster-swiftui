//
//  AlbumList.swift
//  Bad Custer
//
//  Created by Phillip Giammattei on 7/26/20.
//  Copyright © 2020 Phil Giammattei. All rights reserved.
//

import Foundation

class AlbumList: Codable, Identifiable {
    let albums: [Album]
    
    init() {
        albums = Bundle.main.decode([Album].self, from: "albumlist.json")
    }
}
