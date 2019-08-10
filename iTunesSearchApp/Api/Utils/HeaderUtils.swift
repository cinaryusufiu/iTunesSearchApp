//
//  HeaderUtils.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 8.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation
import Alamofire

public typealias HTTPHeader = (field :String , value : String)

class HeaderUtils: NSObject {
    
    static func allDefaultHeaderList() -> HTTPHeaders {
        
        var defaultHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        
        guard let staticHeaderList = HeaderUtils.staticHeaders() else { return defaultHeaders }
        
        for header in staticHeaderList {
            defaultHeaders[header.field] = header.value
        }
        return defaultHeaders
    }
    
    private static func staticHeaders() -> [HTTPHeader]? {
        //    let headerList: [HTTPHeader] = [(field: "", value: "")]
        //    return headerList
        return []
    }
    static func dynamicHeaders() -> [HTTPHeader]? {
        let headers : [HTTPHeader] = []
       // headers.append((field : "",value : ""))
        return headers
    }
}
