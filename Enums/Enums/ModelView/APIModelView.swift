import Foundation

class APIModelView {
    var model: DataModel?
    
    func fetchDataFromServer(completion: @escaping () -> Void) {
        guard let url = URL(string: URLDataSource.apiURL.rawValue) else {
            print("Invalid URL")
            return
        }
        
        APIManager.shared.fetchData(model: DataModel.self, urlApi: url) { [weak self] (data: DataModel?) in
            DispatchQueue.main.async {
                self?.model = data
                completion()
            }
        }
    }
}
