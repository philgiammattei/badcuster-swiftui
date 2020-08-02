//
//  Song.swift
//  Bad Custer
//
//  Created by Phillip Giammattei on 7/26/20.
//  Copyright © 2020 Phil Giammattei. All rights reserved.
//
import Foundation

struct Song: Identifiable, Codable {
    let id = UUID()
    let track: Int
    let title: String
    let album: String
    let src: String
}
