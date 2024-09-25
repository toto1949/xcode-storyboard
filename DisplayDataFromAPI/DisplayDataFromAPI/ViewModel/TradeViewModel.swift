//
//  TradeViewModel.swift
//  DisplayDataFromAPI
//
//  Created by Taooufiq El moutaoouakil on 9/20/24.
//

import Foundation
class TradeViewModel {
    var trade : Trade?
    
    func fetchDataFromAPITrade() async -> Trade? {
        guard let url = URL(string: ApiUrl.tradeUrl.rawValue) else {
            print("Invalid URL")
            return nil
        }

        if let dataList = await APIManager.shared.fetchData(model: Trade.self, from: url) {
                self.trade = dataList
                print(dataList)
                return trade
        } else {
            print("Failed to fetch data")
        }
        return nil
    }

}
