struct Library : Codable {
    var library : LibraryModel
}
struct LibraryModel : Codable {
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
struct Author : Codable{
    var name : String
    var birth_year : Int
    var nationality : String
}
