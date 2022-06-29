//
//  Pagination.swift
//  GiphySearch
//
//  Created by Collie on 2022/06/29.
//

import Foundation

struct Pagination: Codable {
    var totalCount: Int
    var count: Int
    var offset: Int
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count", count, offset
    }
}
