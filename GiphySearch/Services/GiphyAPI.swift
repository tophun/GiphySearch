//
//  GiphyAPI.swift
//  GiphySearch
//
//  Created by Collie on 2022/06/29.
//

import Alamofire

// https://developers.giphy.com/docs/api/endpoint#trending
// https://developers.giphy.com/docs/api/endpoint#search

enum GiphyAPI {
    case trending(offset: Int)
    case search(query: String, offset: Int)
}

extension GiphyAPI: URLRequestConvertible {
    
    var baseURL: URL{
        return URL(string: "https://api.giphy.com/v1/gifs")!
    }
    
    var path: String {
        switch self {
        case .trending:
            return "/trending"
        case .search:
            return "/search"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .trending, .search:
            return .get
        }
    }
    
    var headers: HTTPHeaders {
        let headers = HTTPHeaders()
        return headers
    }
    
    var parameters: Parameters {
        switch self {
        case let .trending(offset):
            return [
                "api_key": Constants.apiKey,
                "limit": 20,
                "offset": offset
            ]
            
        case let .search(query, offset):
            return [
                "api_key": Constants.apiKey,
                "limit": 20,
                "offset": offset,
                "q": query
            ]
        }
    }
    
    var encoding: ParameterEncoding {
        switch method {
        default:
            return URLEncoding.default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.headers = headers
        
        return try encoding.encode(urlRequest, with: parameters)
    }
}
