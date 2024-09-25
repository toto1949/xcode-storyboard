//
//  PostViewController.swift
//  DisplayDataUsingUICollection
//
//  Created by Taooufiq El moutaoouakil on 9/23/24.
//

import Foundation

import UIKit

class PostViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    
    var posts: [Post] = []
    var postViewModel = PosteViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource  = self
        
        
        loadData()
    }
    
    func loadData() {
        Task{
            if let data  = await self.postViewModel.fetchDataFromAPITrade(){
                DispatchQueue.main.async{
                    self.posts = data
                    self.tableview.reloadData()
                }
            }
            else {
                print("Failed to fetch data")
            }
        }
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        
        let post = posts[indexPath.item]
        cell.userid.text = "\(post.userId)"
        cell.id.text = "\(post.id)"
        cell.title.text = post.title
        cell.body.text = post.body

        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
