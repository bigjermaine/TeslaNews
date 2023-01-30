//
//  NewsModel.swift
//  newsapp
//
//  Created by Apple on 29/01/2023.
//

import Foundation

struct Results2 {
     var description: String?
    var title:String
     var url: String?
    var urldata:Data? = nil
    var urlToImage: String?
    
    init(description: String?, title: String, url: String?, urlToImage: String? = nil) {
        self.description = description
        self.title = title
        self.url = url
       
        self.urlToImage = urlToImage
    }
}

// MARK: - Welcome
struct jermaine: Codable {
   
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
  
    let title:String
    let description: String?
    let url: String?
    let urlToImage: String?
  
  
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
