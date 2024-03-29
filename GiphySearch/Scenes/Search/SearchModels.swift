//
//  SearchModels.swift
//  GiphySearch
//
//  Created by Collie on 2022/06/29.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Search {
    
    // MARK: Use cases
    enum Trending {
        
        struct Request {
            var offset: Int
        }
        
        struct Response {
            var gifs: [Gif] = []
            var error: Error?
        }
        
        struct ViewModel {
            var gif: [Gif]
        }
    }
    
    enum Search {
        struct Request {
            var query: String
            var offset: Int
        }
        
        struct Response {
            var gifs: [Gif] = []
            var pagination: Pagination?
            var error: Error?
        }
        
        struct ViewModel {
            var gif: [Gif]
            var totalCount: Int
        }
    }
}
