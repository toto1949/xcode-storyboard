//
//  AlbumViewModel.swift
//  DisplayDataUsingUICollection
//
//  Created by Taooufiq El moutaoouakil on 9/23/24.
//

import Foundation
class AlbumViewModel  {
    var albums: [AlbumModel]?

    func fetchDataFromAPITrade() async -> [AlbumModel]? {
        guard let url = URL(string: ApiURL.albumURL.rawValue) else {
            print("Invalid URL")
            return nil
        }
        
        if let dataList = await APIManager.shared.fetchData(model: AlbumModel.self, from: url) {
            self.albums = dataList
            return albums
        } else {
            print("Failed to fetch data")
        }
        return nil
    }
}
