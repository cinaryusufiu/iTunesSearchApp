//
//  APIClient.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 8.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation
import Alamofire

final class APIClient  {
    
    static let shared : APIClient = APIClient()
    private var manager : SessionManager
    
    init() {
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = HeaderUtils.allDefaultHeaderList()
        configuration.timeoutIntervalForRequest = 20
        configuration.timeoutIntervalForResource = 20
        manager = SessionManager(configuration: configuration)
    }
    func requestJSON(_ router: BaseApiRouter, completionHandler: @escaping (DataResponse<Any>?, Error?) -> Void) {
        
        manager.request(router)
            .validate(statusCode: 200..<300)
           // .validate(contentType: [ApiConfig.DefaultCodingKey.jsonContentType])
            .responseJSON { response in
                completionHandler(response, response.result.error)
        }
    }
}
