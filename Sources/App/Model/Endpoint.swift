//
//  File.swift
//  
//
//  Created by Karen Karapetyan on 11.04.21.
//

import Foundation

struct TGEndpoint {
    let path: String
    let queryItems: [URLQueryItem]?
}

extension TGEndpoint {
    
    var url: URL! {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.telegram.org"
        components.path = "/bot" + Constants.telegramToken + path
        components.queryItems = queryItems
        return components.url
    }
}

//MARK: - Tracks
extension TGEndpoint {
    
    static var sendMessage: TGEndpoint {
        let endpoint = TGEndpoint(path: "/sendMessage", queryItems: nil)
        return endpoint
    }
}
