import Foundation

class APIModelView {
    var model: [DataModel] = []

    func fetchDataFromServer(completion: @escaping ([DataModel]?) -> Void) {
        guard let apiUrl = URL(string: Constants.apiURL.rawValue) else {
            completion(nil)
            return
        }

        APIManager.shared.fetchData(model: [DataModel].self, urlApi: apiUrl) { [weak self] dataList in
            if let dataList = dataList {
                self?.model = dataList
                print(dataList)
                completion(dataList)
            } else {
                completion(nil)
            }
        }
    }
}
