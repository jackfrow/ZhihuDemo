//
//  zhRequestManager.swift
//  ZhihuDemo
//
//  Created by jackfrow on 2022/4/18.
//

import Foundation
import Moya
import PromiseKit
import ObjectMapper


enum zhError:Error{
  case InvalidData
}



class zhRequestManager {
    
    static let shared = zhRequestManager()
    let provider = MoyaProvider<MultiTarget>()
    
    
    func startRequestFetch<T:BaseMappable>(_ target: MultiTarget) -> Promise<T>  {

        return Promise<T> { Resolver in
            
            provider.request(target, completion: { (result) in
                switch result {
                case let .success(response):
                                     
                    guard let result = Mapper<T>().map(JSON: response.data) else{
                        Resolver.reject(zhError.InvalidData)
                        return
                    }
                    Resolver.fulfill(result)
                    
                case let .failure(error):
                    Resolver.reject(error)
                }
            })
            
        }
        
    }
    
    
}
