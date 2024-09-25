//
//  Trade.swift
//  URLSession
//
//  Created by Taooufiq El moutaoouakil on 9/20/24.
//

import Foundation
struct Trade : Codable {
    var status : String
    var totalResults : Int
    var articles : [Article]
    
    struct Article : Codable {
        var source : Source
        var author : String
        var title : String
        var desciprion : String
        var url : String
        var urlToImage : String
        var publishedAt : String
        var content : String
        
        struct Source : Codable {
            var id : String?
            var name : String
        }
    }
}

/*
 {
       "source": {
         "id": null,
         "name": "Seekingalpha.com"
       },
       "author": "Victor Dergunov",
       "title": "Tesla: The Top Is Here",
       "description": "To say that Tesla has been on fire lately is an understatement. The stock has gone parabolic, Bitcoin like, vertical in recent weeks.The company's market cap is now around $160 billion, and its projected 2020 P/E multiple is roughly 113.Stocks cannot continuo…",
       "url": "https://seekingalpha.com/article/4321590-tesla-top-is",
       "urlToImage": "https://static.seekingalpha.com/uploads/2020/2/5/48200183-15809104384836764_origin.jpg",
       "publishedAt": "2020-02-05T15:47:40Z",
       "content": "Image Source\r\nTesla's Top Is Here\r\nTeslas (TSLA) stock has entered full throttle ludicrous mode, as shares have literally turned vertical in recent sessions. Due to what I referred to as the short squeeze of the century in a previous article, as well as vario… [+5303 chars]"
     },
 */
