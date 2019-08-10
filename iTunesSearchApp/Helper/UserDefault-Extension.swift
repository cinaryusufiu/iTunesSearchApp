//
//  UserDefault-Extension.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 10.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation
import UIKit

extension UserDefaults {
    
    enum UserDefaultKeys : String {
        case searchModels
        case filterOptionModel
    }
    
    //MARK:FilterOptionModel
    func getFilterOptionModel() -> FilterOptionModel {
        guard let filterData = data(forKey: UserDefaultKeys.filterOptionModel.rawValue) else { return FilterOptionModel()}
        do {
            let filterOptionModel =  try JSONDecoder().decode(FilterOptionModel.self, from: filterData)
            return filterOptionModel
        } catch let decoderError {
            print("failed to decoder",decoderError)
        }
        return FilterOptionModel()
    }
    func saveFilterOptionModel(filterOptionModel:FilterOptionModel){
        do {
            let data = try JSONEncoder().encode(filterOptionModel)
            set(data, forKey: UserDefaultKeys.filterOptionModel.rawValue)
            synchronize()
        } catch let encodeError {
            print("Failed to encode filterOptionModel ",encodeError)
        }
    }
    
    //MARK:SearchModels
    func getSearchModels() -> [SearchModel]? {
        guard let searchData = data(forKey: UserDefaultKeys.searchModels.rawValue) else { return nil}
        do {
            let searchModels =  try JSONDecoder().decode([SearchModel].self, from: searchData)
            return searchModels
        } catch let decoderError {
            print("failed to decoder",decoderError)
        }
        return nil
    }
    func saveSearchModels(searchModels:[SearchModel]){
        do {
            let data = try JSONEncoder().encode(searchModels)
            set(data, forKey: UserDefaultKeys.searchModels.rawValue)
            synchronize()
        } catch let encodeError {
            print("Failed to encode searchModels ",encodeError)
        }
    }
}
