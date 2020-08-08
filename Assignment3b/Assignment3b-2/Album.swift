//
//  Album.swift
//  Assignment3b-2
//
//  Created by Patrick Spafford on 7/28/20.
//  Copyright © 2020 Patrick Spafford. All rights reserved.
//

import Foundation

struct Album: Codable {
    var artist: String
    var albumName: String
    var yearOfRelease : String
    var recordLabel : String
    var tracks : [Track]
}

struct Track: Codable {
    var name: String
    var duration: String = "4:03"
}

