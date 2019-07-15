//
//  Article.swift
//  NewsApp
//
//  Created by Horbach on 15.04.19.
//  Copyright © 2019 Horbach. All rights reserved.
//

import Foundation
struct Article {
    var author:String
    var title: String
    var description: String
    var publishedAd: String
    var url: String
    var urlToImage:String
    var sourceName:String
    init (dictionary: Dictionary<String, Any >){
        author = dictionary["author"] as? String ?? ""
        title  = dictionary["title"] as? String ?? ""
        description = dictionary["description"] as? String ?? ""
        publishedAd = dictionary["publishedAd"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        urlToImage = dictionary["urlToImage"] as? String ?? ""
        sourceName = (dictionary["source"] as? Dictionary<String, Any> ?? ["":""])["name"] as? String ?? ""
    }
}
