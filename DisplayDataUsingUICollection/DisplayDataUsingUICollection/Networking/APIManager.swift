//
//  APIManager.swift
//  DisplayDataUsingUICollection
//
//  Created by Taooufiq El moutaoouakil on 9/23/24.
//

import Foundation


class APIManager {
    static let shared = APIManager()
    
    private init() {}
    
    func fetchData<T: Decodable>(model: T.Type, from urlApi: URL) async -> [T]? {
        do {
            let (data, _) = try await URLSession.shared.data(for: URLRequest(url: urlApi))
                    
                let apiData = try JSONDecoder().decode([T].self, from: data)
                return apiData
                
            
        } catch {
            print("Error occurred: \(error.localizedDescription)")
            return nil
        }
    }

    }
