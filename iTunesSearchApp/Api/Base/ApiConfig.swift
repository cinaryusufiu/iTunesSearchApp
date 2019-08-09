//
//  ApiConfig.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 8.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation

struct ApiConfig {
    
    static let baseApiUrl : String = "https://itunes.apple.com"
    
    struct CodingKey {
        static let search : String = "term"
        static let limit : String = "limit"
        static let mediaType : String = "media"
        static let country : String = "country"
        static let contentType : String = "Content-Type"
    }
    struct DefaultCodingKey {
        static let limitValue : Int = 25
        static let entityAll : String = "all"
        static let country : String = "TR"
        static let jsonContentType: String = "application/json"
    }
}
