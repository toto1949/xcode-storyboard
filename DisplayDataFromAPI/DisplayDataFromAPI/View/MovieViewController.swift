//
//  MovieViewController.swift
//  DisplayDataFromAPI
//
//  Created by Taooufiq El moutaoouakil on 9/20/24.
//

import Foundation
import UIKit

class MovieViewController :UIViewController {
    
    var viewModel = MovieViewModel()

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        tableview.dataSource = self
        tableview.delegate = self
        super.viewDidLoad()
        callAPI()
    }
    
    func callAPI() {
//        viewModel.fetchDataFromAPIMovie { data in
//            DispatchQueue.main.async {
//                if let data = data {
//                    self.viewModel.movie = data
//                    self.tableview.reloadData()
//                } else {
//                    print("Failed to fetch data")
//                }
//            }
//        }
    }
}

extension MovieViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movie?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        if let item = viewModel.movie?[indexPath.row] {
            cell.account_idlabel.text = item.account_id
            cell.titleMovie.text = item.title
            cell.created_atLabel.text = item.created_at
            cell.duratioonlabel.text = "\(String(item.duration))"
            cell.statelabel.text = item.state
            cell.urlMovieLabel.text = String(item.original_movie.size)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}
