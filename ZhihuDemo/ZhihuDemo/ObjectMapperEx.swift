//
//  ObjectMapperEx.swift
//  ZhihuDemo
//
//  Created by jackfrow on 2022/4/18.
//

import Foundation
import ObjectMapper



extension Mapper{
    func map(JSON data: Data) -> N? {
        
        if let string = String(data: data, encoding: .utf8) {
            return map(JSONString: string)
        }
        return nil
    }
}
