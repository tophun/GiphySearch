//
//  DetailInteractor.swift
//  GiphySearch
//
//  Created by Collie on 2022/06/30.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DetailBusinessLogic {
    func fetch()
}

protocol DetailDataStore {
    var gif: Gif? { get set }
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore {
    var presenter: DetailPresentationLogic?
    var worker: DetailWorker?
    var gif: Gif?
    
    func fetch() {
        guard let gif = gif else { return }
        let response = Detail.Fetch.Response(gif: gif)
        presenter?.presentFetch(response: response)
    }
}
