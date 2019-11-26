//
//  Movie.swift
//  Movie Junk
//
//  Created by Omar on 11/25/19.
//  Copyright © 2019 Omar. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let title: String?
    let image: String?
    let rating: Double?
    let releaseYear: Int?
    let genre: [String]?
}


