//
//  FavoriteManager.swift
//  GiphySearch
//
//  Created by Collie on 2022/06/29.
//

import Foundation

class FavoriteManager {
    static let shared: FavoriteManager = {
        let shared = FavoriteManager()
        shared._list = UserDefaults.standard.object([Gif].self, with: "favorite_gifs") ?? []
        return shared
    }()
    
    // MARK: - Private
    private var _list: [Gif] = []
    
    var list: [Gif] {
        get {
            return _list
        }
        set {
            _list = newValue
            UserDefaults.standard.set(object: newValue, forKey: "favorite_gifs")
            UserDefaults.standard.synchronize()
        }
    }
    
    func create(_ gif: Gif) {
        list.append(gif)
    }
    
    func delete(_ gif: Gif) {
        list.removeAll { $0.id == gif.id }
    }
}
