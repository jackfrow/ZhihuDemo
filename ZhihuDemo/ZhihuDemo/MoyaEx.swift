//
//  MoyaEx.swift
//  ZhihuDemo
//
//  Created by jackfrow on 2022/4/18.
//

import Foundation
import Moya
import ObjectMapper


public extension Response {
  /// Maps data received from the signal into an object which implements the Mappable protocol.
  /// If the conversion fails, the signal errors.
    func mapObject<T: BaseMappable>(_ type: T.Type, context: MapContext? = nil) throws -> T {
        guard let object = Mapper<T>(context: context).map(JSONObject: try mapJSON()) else {
      throw MoyaError.jsonMapping(self)
    }
   return object
  }
}
