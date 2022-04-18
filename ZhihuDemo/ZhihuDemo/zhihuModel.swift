//
//  zhihuModel.swift
//  ZhihuDemo
//
//  Created by jackfrow on 2022/4/18.
//

import Foundation
import ObjectMapper


class zhihuResponse: Mappable{
    
    init() {
        
    }
    
    var date:String?
    var stories:[zhihuModel]?
    var top_stories:[zhihuModel]?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        date <- map["date"]
        stories <- map["stories"]
        top_stories <- map["top_stories"]
    }
    
    
}


class zhihuModel: Mappable  {
    
    var image_hue:String?
    var title:String?
    var url:String?
    var hint:String?
    var ga_prefix:String?
    var images:[String]?
    var type:String?
    var id:String?
    var image:String?
    
    
    var lodaUrl:String?{
        if let image = image {
            return image
        }
        return images?.first
        
    }
    
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        image_hue <- map["image_hue"]
        title <- map["title"]
        url <- map["url"]
        hint <- map["hint"]
        ga_prefix <- map["ga_prefix"]
        images <- map["images"]
        type <- map["type"]
        id <- map["id"]
        image <- map["image"]
        
    }
    
    
}


