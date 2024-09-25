import Foundation
class LibraryViewModel{
    var libraryData : LibraryModel?
    let jsonLibraryData = """
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
          },
          {
            "title": "Book 2",
            "author": {
              "name": "George Orwell",
              "birth_year": 1903,
              "nationality": "British"
            },
            "publication_year": 1949,
            "genres": ["Dystopian", "Political Fiction", "Science Fiction"]
          },
          {
            "title": "Pride and Prejudice",
            "author": {
              "name": "Jane Austen",
              "birth_year": 1775,
              "nationality": "British"
            },
            "publication_year": 1813,
            "genres": ["Romance", "Classic"]
          },
          {
            "title": "The Catcher in the Rye",
            "author": {
              "name": "J.D. Salinger",
              "birth_year": 1919,
              "nationality": "American"
            },
            "publication_year": 1951,
            "genres": ["Fiction", "Classic"]
          }
        ]
      }
    }
    """

    func fetchLibraryData() {
        guard let jsonData = jsonLibraryData.data(using: .utf8) else {
                 print("Error converting JSON string to Data")
                 return
             }
             do {
                 let decodedData = try JSONDecoder().decode(Library.self, from: jsonData)
                 self.libraryData = decodedData.library  // Set the library data
                 print("Library data fetched successfully")
             } catch {
                 print("Error decoding JSON: \(error)")
             }
       }
}
