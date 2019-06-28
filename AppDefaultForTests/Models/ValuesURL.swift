//
//  ValuesURL.swift
//  AppDefaultForTests
//
//  Created by Smiles on 28/06/19.
//  Copyright © 2019 Mariana. All rights reserved.
//

import Foundation

struct ValuesURL: Codable {
    var getSize: [Size] = []
}

struct ImageURL: Codable {
    let sizes: Sizes
    let stat: String
}

struct Sizes: Codable {
    let canblog, canprint, candownload: Int
    let size: [Size]
}

struct Size: Codable {
    let label: String
    let source: String
    let url: String
    let media: Media
}

enum Media: String, Codable {
    case photo = "photo"
}
