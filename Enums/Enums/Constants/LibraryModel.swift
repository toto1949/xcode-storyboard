import Foundation
import UIKit
struct LibraryModel : Codable {
    var library : Library
}
struct Library : Codable{
    var name : String
    var location : String
    var books : [Book]
    
}
struct Book : Codable{
    var title : String
    var author : Author
    var publication_year : Int
    var genres : [String]
    
}
struct Author : Codable {
    var name : String
    var birth_year : Int
    var nationality : String
}
/*
 {
   "library": {
     "name": "My Library",
     "location": "New York",
     "books": [
       {
         "title": "The Great Gatsby",
         "author": {
           "name": "F. Scott Fitzgerald",
           "birth_year": 1896,
           "nationality": "American"
         },
         "publication_year": 1925,
         "genres": ["Fiction", "Classic", "Literary"]
       },
       {
         "title": "To Kill a Mockingbird",
         "author": {
           "name": "Harper Lee",
           "birth_year": 1926,
           "nationality": "American"
         },
         "publication_year": 1960,
         "genres": ["Fiction", "Classic", "Literary"]
       }
     ]
   }
 }
 */
