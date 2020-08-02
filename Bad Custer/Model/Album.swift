//
//  Album.swift
//  Bad Custer
//
//  Created by Phillip Giammattei on 7/26/20.
//  Copyright © 2020 Phil Giammattei. All rights reserved.
//

import Foundation

struct Album: Identifiable, Codable {
    let id: Int
    let name: String
    let cover: String
    let release: String
}
