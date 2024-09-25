import Foundation

struct Movie: Codable {
    let duration: Double
    let imageID: String?
    let plays: Int
    let createdAt: String
    let size: Int
    let transcodings: [Transcoding]
    let title: String
    let updatedAt: String
    let accountID: String
    let progress: Double
    let originalMovie: OriginalMovie
    let tags: [String]
    let id: String
    let aspectRatioMultiplier: Double
    let screenshot: Screenshot
    let state: String
    
    struct Transcoding: Codable {
        let id: String
        let rtmpStreamURI: String
        let size: Int
        let httpURI: String
        let title: String
        let progress: Double
        let rtmpBaseURI: String
        let bitrate: Int
        let height: Int
        let rtmpURI: String
        let state: String
        let width: Int
    }
    
    struct OriginalMovie: Codable {
        let httpURI: String
        let size: Int
    }
    
    struct Screenshot: Codable {
        let normal: String
        let thumb: String
        let original: String
    }
}
/*
 Create a struct of this


   {
     "duration": 185.5,
     "image_id": null,
     "plays": 0,
     "created_at": "2010-09-14T14:04:48+00:00",
     "size": 2308154,
     "transcodings": [
       {
         "id": "4cea850054129010f3000023",
         "rtmp_stream_uri": "mp4:movies/4c50424cb35ea827c0000005_4c8f8100b35ea84de0000002_h264_500.mp4",
         "size": 9991114,
         "http_uri": "d8bdb1x4b4k4w.cloudfront.net/movies/4c50424cb35ea827c0000005_4c8f8100b35ea84de0000002_h264_500.mp4",
         "title": "h264_500",
         "progress": 1.0,
         "rtmp_base_uri": "s1qbxw1zg88x1h.cloudfront.net/cfx/st",
         "bitrate": 464,
         "height": 240,
         "rtmp_uri": "s1qbxw1zg88x1h.cloudfront.net/cfx/st/movies/4c50424cb35ea827c0000005_4c8f8100b35ea84de0000002_h264_500.mp4",
         "state": "ready",
         "width": 320
       },
       {
         "id": "4cea850054129010f3000024",
         "rtmp_stream_uri": "mp4:movies/4c50424cb35ea827c0000005_4c8f8100b35ea84de0000002_h264_1000.mp4",
         "size": 19994420,
         "http_uri": "d8bdb1x4b4k4w.cloudfront.net/movies/4c50424cb35ea827c0000005_4c8f8100b35ea84de0000002_h264_1000.mp4",
         "title": "h264_1000",
         "progress": 1.0,
         "rtmp_base_uri": "s1qbxw1zg88x1h.cloudfront.net/cfx/st",
         "bitrate": 928,
         "height": 480,
         "rtmp_uri": "s1qbxw1zg88x1h.cloudfront.net/cfx/st/movies/4c50424cb35ea827c0000005_4c8f8100b35ea84de0000002_h264_1000.mp4",
         "state": "ready",
         "width": 640
       }
     ],
     "title": "Awesome",
     "updated_at": "2010-09-14T14:04:51+00:00",
     "account_id": "4c50424cb35ea827c0000005",
     "progress": 1.0,
     "original_movie": {
       "http_uri": "d8bdb1x4b4k4w.cloudfront.net/original_movies/4c50424cb35ea827c0000005_4c8f8100b35ea84de0000002.wmv",
       "size": 2308154
     },
     "tags": ["hd", "sweet"],
     "id": "4c8f8100b35ea84de0000002",
     "aspect_ratio_multiplier": 1.33333333333333,
     "screenshot": {
       "normal": "d8bdb1x4b4k4w.cloudfront.net/images/4c50424cb35ea827c0000005_4c8f8100b35ea84de0000004_normal.jpg",
       "thumb": "d8bdb1x4b4k4w.cloudfront.net/images/4c50424cb35ea827c0000005_4c8f8100b35ea84de0000004_thumb.jpg",
       "original": "d8bdb1x4b4k4w.cloudfront.net/images/4c50424cb35ea827c0000005_4c8f8100b35ea84de0000004_original.jpg"
     },
     "state": "ready"
   }
 ]
 */
