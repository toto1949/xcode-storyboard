//
//  TradeViewController.swift
//  DisplayDataFromAPI
//
//  Created by Taooufiq El moutaoouakil on 9/20/24.
//

import Foundation
import UIKit
class TradeViewController : UIViewController{
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var totalResultLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    var tradeModelView = TradeViewModel()
    override func viewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
        super.viewDidLoad()
    
        callAPI()
    }
    func callAPI() {
        Task {
            if let data = await tradeModelView.fetchDataFromAPITrade() {
                DispatchQueue.main.async {
                    self.tradeModelView.trade = data
                    self.totalResultLabel.text = String(self.tradeModelView.trade?.totalResults ?? 0)
                    self.statusLabel.text = self.tradeModelView.trade?.status ?? "KO"
                    self.tableview.reloadData()
                }
            } else {
                print("Failed to fetch data")
            }
        }
    }

}

extension TradeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tradeModelView.trade?.articles.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TradeCell", for: indexPath) as! TradeCell
        if let item = tradeModelView.trade?.articles[indexPath.row] {
            cell.Author.text = item.author
            cell.content.text = item.content
            cell.descriptionlabel.text = item.articleDescription
            cell.title.text = item.title
            cell.sourceNameLabel.text = item.source.name
            
            if let urlString = item.urlToImage, let url = URL(string: urlString) {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            cell.imagepro.image = UIImage(data: data)
                        }
                    }
                }
            } else {
                cell.imagepro.image = nil
            }
        }
        
        return cell
    }

    
    
}
