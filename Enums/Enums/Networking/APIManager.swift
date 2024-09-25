import Foundation

class APIManager {
    static let shared = APIManager()
    
    private init() {}
    
    func fetchData<T: Decodable>(model: T.Type, urlApi: URL, completion: @escaping (T?) -> Void) {
        URLSession.shared.dataTask(with: urlApi) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            if let dataString = String(data: data, encoding: .utf8) {
                print("Raw response data: \(dataString)")
            } else {
                print("Unable to convert data to string")
            }
            
            do {
                let apiData = try JSONDecoder().decode(T.self, from: data)
                completion(apiData)
            } catch {
                completion(nil)
            }
        }.resume()
    }
}
