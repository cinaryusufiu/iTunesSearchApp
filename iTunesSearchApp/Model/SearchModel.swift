//
//  Podcast.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 8.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation

struct SearchModel : Codable {
    
    var kind : String?
    var artistName : String?
    var collectionName : String?
    var imageUrl: String?
    var country: String?
    var shortDescription : String?
    
    var isClicked : Bool? = false
   
    enum CodingKeys : String, CodingKey{
        case kind
        case artistName
        case collectionName
        case artworkUrl100
        case country
        case shortDescription
        case isClicked
    }
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        kind = try? container.decode(String.self, forKey: .kind)
        artistName = try? container.decode(String.self, forKey: .artistName)
        collectionName = try? container.decode(String.self, forKey: .collectionName)
        imageUrl = try? container.decode(String.self, forKey: .artworkUrl100)
        country = try? container.decode(String.self, forKey: .country)
        shortDescription = try? container.decode(String.self, forKey: .shortDescription)
        isClicked = try? container.decode(Bool.self, forKey: .isClicked)
    }
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(kind, forKey: .kind)
        try container.encode(artistName, forKey: .artistName)
        try container.encode(collectionName, forKey: .collectionName)
        try container.encode(imageUrl, forKey: .artworkUrl100)
        try container.encode(country, forKey: .country)
        try container.encode(shortDescription, forKey: .shortDescription)
        try container.encode(isClicked, forKey: .isClicked)
        
    }
}
