//
//  SearchRouter.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 8.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation
import Alamofire

final class SearchRouter : BaseApiRouter {
    
    //MARK:Base-Property
    override var method: HTTPMethod {
        return configureMethodWithEndPoint()
    }
    override var path: String{
        return configurePathWithEndPoint()
    }
    override var parameters: APIParameters {
        return configureParametersWithEndPoint()
    }
    override var encoding: ParameterEncoding?{
        return configureEncodingWithEndPoint()
    }
    let endPoint: SearchRouterEndPoint
    
    enum SearchRouterEndPoint {
        case searchWithTerm(term : String , mediaType : String)
        case none(errorMessage: String)
    }
    
    init(endPoint : SearchRouterEndPoint) {
        self.endPoint = endPoint
    }
    
    //MARK:Helper
    override func configureParametersWithEndPoint() ->APIParameters {
        switch endPoint {
        case .searchWithTerm(let searchText , let mediaType):
           return [
                    ApiConfig.CodingKey.search:searchText ,
                    ApiConfig.CodingKey.limit : ApiConfig.DefaultCodingKey.limitValue,
                    ApiConfig.CodingKey.country : ApiConfig.DefaultCodingKey.country,
                    ApiConfig.CodingKey.mediaType : mediaType
                 ]
        default:
            return [:]
        }
    }
    override func configureEncodingWithEndPoint() -> ParameterEncoding? {
        switch endPoint {
        case .searchWithTerm:
            return URLEncoding.default//...
        default:
            return URLEncoding.default
        }
    }
    override func configurePathWithEndPoint() -> String {
        switch endPoint {
        case .searchWithTerm:
            return URLString.Search.search
        default:
            return URLString.none
        }
    }
    override func configureMethodWithEndPoint() -> HTTPMethod {
        switch endPoint {
        case .searchWithTerm:
            return .get
        default:
            return .get // .post
        }
    }
}


