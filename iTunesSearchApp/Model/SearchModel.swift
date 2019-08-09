//
//  Podcast.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 8.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation

struct SearchModel : Codable {
    
    var collectionId : Int?
    var artistId : Int?
    var trackId:Int?
    
    var wrapperType : String?
    var kind : String?
    var artistName : String?
    var collectionName : String?
    var trackName : String?
    var imageName: String?
    var country: String?
    
   
    enum CodingKeys : String, CodingKey{
        
        case collectionId
        case artistId
        case trackId
        case wrapperType
        case kind
        case artistName
        case collectionName
        case trackName
        case artworkUrl100
        case country
    }
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        collectionId =  try? container.decode(Int.self, forKey: .collectionId)
        artistId =  try? container.decode(Int.self, forKey: .artistId)
        trackId =  try? container.decode(Int.self, forKey: .trackId)
        
        wrapperType = try? container.decode(String.self, forKey: .wrapperType)
        kind = try? container.decode(String.self, forKey: .kind)
        artistName = try? container.decode(String.self, forKey: .artistName)
        collectionName = try? container.decode(String.self, forKey: .collectionName)
        trackName = try? container.decode(String.self, forKey: .trackName)
        imageName = try? container.decode(String.self, forKey: .artworkUrl100)
        country = try? container.decode(String.self, forKey: .country)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(collectionId, forKey: .collectionId)
        try container.encode(artistId, forKey: .artistId)
        try container.encode(trackId, forKey: .trackId)
        try container.encode(wrapperType, forKey: .wrapperType)
        try container.encode(kind, forKey: .kind)
        try container.encode(artistName, forKey: .artistName)
        try container.encode(collectionName, forKey: .collectionName)
        try container.encode(trackName, forKey: .trackName)
        try container.encode(imageName, forKey: .artworkUrl100)
        try container.encode(country, forKey: .country)
    }
}
