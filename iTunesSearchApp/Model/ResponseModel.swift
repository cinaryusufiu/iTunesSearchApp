//
//  ResponseModel.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 8.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation


struct ResponseModel<T:Codable>: Codable {
    
    var count: Int?
    var results : [T]?
    
    enum CodingKeys :String, CodingKey{
        case resultCount
        case results
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        count =  try? container.decode(Int.self, forKey: .resultCount)
        results = try? container.decode([T].self, forKey: .results)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(count, forKey: .resultCount)
        try container.encode(results, forKey: .results)
    }
}
