//
//  GifsResponse.swift
//  GiphySearch
//
//  Created by Collie on 2022/06/29.
//

import Foundation

struct GifsResponse: Codable {
    var data: [Gif]
    var pagination: Pagination
    var meta: Meta
    
    enum CodingKeys: String, CodingKey {
        case data, pagination, meta
    }
}
