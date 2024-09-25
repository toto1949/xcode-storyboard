import Foundation

class APIManager {
    static let shared = APIManager()
    
    private init(){}
    
    func fetchData<T : Decodable>(model : T.Type, urlApi : URL,completion : @escaping(T?) -> Void){
        URLSession.shared.dataTask(with: urlApi) {data, response, error in
            guard error  == nil else {
                return
            }
            guard let data = data else {
                return
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
