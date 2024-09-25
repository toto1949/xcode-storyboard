//
//  Movie.swift
//  DisplayDataFromAPI
//
//  Created by Taooufiq El moutaoouakil on 9/20/24.
//

import Foundation

struct Movie : Codable{
    var duration : Double
    var image_id : String?
    var plays : Int
    var created_at : String
    var size : Int
    var transcodings : [Transcoding]
    var title : String
    var updated_at: String
    var account_id : String
    var progress : Double
    var original_movie : OriginalMovie
    var tags : [String]
    var id : String
    var aspect_ratio_multiplier : Double
    var screenshot : Screenshot
    var state : String

    struct Screenshot : Codable {
        var normal : String
        var thumb : String
        var original : String
    }
    struct OriginalMovie : Codable {
        var http_uri : String
        var size : Int
    }
    
    struct Transcoding : Codable {
        var id : String
        var rtmp_stream_uri : String
        var size : Int
        var http_uri : String
        var title : String
        var progress : Double
        var rtmp_base_uri : String
        var bitrate : Int
        var height : Int
        var rtmp_uri : String
        var state : String
        var width : Int
    }
}

