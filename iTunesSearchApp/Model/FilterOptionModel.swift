//
//  FilterOptionModel.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 10.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation

struct FilterOptionModel : Codable {
   
    var mediaType : Int?
    var term : String?
    
    init() {
        mediaType = 0
    }
}
