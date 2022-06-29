//
//  Gif.swift
//  GiphySearch
//
//  Created by Collie on 2022/06/29.
//

import Foundation

struct Gif: Codable {
    var url: String
    var images: Images
}

struct Images {
    var original: Original
    var originalStill: Preview
    var preview: Preview
    var previewStill: Preview
    
    enum CodingKeys: String, CodingKey {
        case original
        case originalStill = "original_still"
        case preview = "preview_gif"
        case previewStill = "downsized_still"
    }
}

struct Original: Codable {
    let height: String
    let width: String
    let size: String
    let url: String
    let mp4Size: String?
    let mp4: String?
    let webpSize: String
    let webp: String
    let frames: String?
    let hash: String?
    
    enum CodingKeys: String, CodingKey {
        case height = "height"
        case width = "width"
        case size = "size"
        case url = "url"
        case mp4Size = "mp4_size"
        case mp4 = "mp4"
        case webpSize = "webp_size"
        case webp = "webp"
        case frames = "frames"
        case hash = "hash"
    }
}

struct Preview: Codable {
    let height: String
    let width: String
    let size: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case height = "height"
        case width = "width"
        case size = "size"
        case url = "url"
    }
}
