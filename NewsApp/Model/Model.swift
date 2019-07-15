//
//  Model.swift
//  NewsApp
//
//  Created by Horbach on 15.04.19.
//  Copyright © 2019 Horbach. All rights reserved.
//

import Foundation

var articles: [Article]  {
    
    let data = try? Data(contentsOf: urlToData )
    if data==nil{
        return []
    }
    
    /*
     do{
     let rootDictionary =  try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, Any>
     }catch{
     error.localizedDescription
     }
     */
    let rootDictionaryAny =  try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, Any>
    if rootDictionaryAny == nil{
        return []
    }
    //let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
    let rootDictionary = rootDictionaryAny
    if rootDictionary == nil{
        return []
    }
    
    if let array = rootDictionary!["articles"] as? [Dictionary<String, Any>]{
        var returnArray: [Article] = []
        for dict in array{
            let newArticle = Article(dictionary: dict)
            returnArray.append(newArticle)
        }
        return returnArray
    }
    return[]
}

var urlToData:URL{
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}
func loadNews(completionHandler: (()->Void)?) {
    let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&from=2019-03-15&sortBy=publishedAt&apiKey=7f2a9176b46c486eb3b2a4059c0ba5d7")
    
    let session = URLSession(configuration: .default)
    
    let downloadTask = session.downloadTask(with: url!) { (urlFile, response , error) in
        if urlFile != nil{

          try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
            
            completionHandler?()
        
        }
    }
    downloadTask.resume()
}

