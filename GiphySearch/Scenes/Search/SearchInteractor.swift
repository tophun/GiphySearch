//
//  SearchInteractor.swift
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

protocol SearchBusinessLogic {
    
}

protocol SearchDataStore {
    
}

class SearchInteractor: SearchBusinessLogic, SearchDataStore {
    var presenter: SearchPresentationLogic?
    var worker: SearchWorker?
    
}
