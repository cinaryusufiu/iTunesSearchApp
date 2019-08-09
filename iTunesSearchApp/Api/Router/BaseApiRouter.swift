//
//  BaseApiRouter.swift
//  iTunesSearchApp
//
//  Created by Yusuf Çınar on 8.08.2019.
//  Copyright © 2019 Yusuf Cinar. All rights reserved.
//

import Foundation
import Alamofire

typealias APIParameters = [String : Any]?

protocol APIConfiguration {
    var baseUrl : String { get }
    var headers : [HTTPHeader]? { get }
    var method : Alamofire.HTTPMethod{ get}
    var parameters : APIParameters{ get }
    var path : String { get }
    var encoding : Alamofire.ParameterEncoding?{ get }
}
public class BaseApiRouter: URLRequestConvertible , APIConfiguration{
    
    var baseUrl: String{
        // fatalError("encoding must be overridden in subclass")
        return ApiConfig.baseApiUrl
    }
    var headers: [HTTPHeader]?{
        return  HeaderUtils.dynamicHeaders()
    }
    var method: Alamofire.HTTPMethod {
        fatalError("parameters must be overridden in subclass")
    }
    var parameters : APIParameters {
        fatalError("parameters must be overridden in subclass")
    }
    var path: String {
        fatalError("path must be overridden in subclass")
    }
    var encoding: Alamofire.ParameterEncoding? {
        fatalError("encoding must be overridden in subclass")
    }
    public func asURLRequest() throws -> URLRequest {
        
        let url  = try baseUrl.asURL()
        var urlRequest  = URLRequest(url: url.appendingPathComponent(path))
        
        if path.count == 0 {
            urlRequest = URLRequest(url: url)
        }
        urlRequest.httpMethod = method.rawValue
        if let headers = self.headers {
            headers.forEach { (header) in
                urlRequest.setValue(header.value, forHTTPHeaderField: header.field)
            }
        }
        
        if let encoding = self.encoding {
            return try  encoding.encode(urlRequest, with: parameters)
        }
        return urlRequest
    }
    func asURLPath() -> String {
        return (try? asURLRequest())?.url?.absoluteString ?? "Url not found"
    }
    
    //MARK:Configure Methods
    internal func configureParametersWithEndPoint()->APIParameters{
        
        return nil
    }
    internal func configureEncodingWithEndPoint() ->Alamofire.ParameterEncoding?{
        
        return nil
    }
    internal func configureMethodWithEndPoint() ->HTTPMethod {
        
        return .get
    }
    internal func configurePathWithEndPoint() -> String {
        return String()
    }
}
