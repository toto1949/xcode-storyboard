//
//  PosteViewModel.swift
//  DisplayDataUsingUICollection
//
//  Created by Taooufiq El moutaoouakil on 9/23/24.
//

import Foundation


class PosteViewModel {
    
    var post : [Post]?
    
    func fetchDataFromAPITrade() async -> [Post]? {
        guard let url = URL(string: ApiURL.postURL.rawValue) else {
            print("Invalid URL")
            return nil
        }
        
        if let dataList = await APIManager.shared.fetchData(model: Post.self, from: url) {
            self.post = dataList
            print(dataList)
            return post
        } else {
            print("Failed to fetch data")
        }
        return nil
    }
}
