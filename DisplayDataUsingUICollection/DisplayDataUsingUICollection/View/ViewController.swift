//
//  ViewController.swift
//  DisplayDataUsingUICollection
//
//  Created by Taooufiq El moutaoouakil on 9/23/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var albumAction: UIButton!
    @IBOutlet weak var postAction: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showAlbumData(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let postViewController = storyboard.instantiateViewController(withIdentifier: "PostViewController") as? PostViewController {
            navigationController?.pushViewController(postViewController, animated: true)
        }
    }

    @IBAction func showPostData(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let albumViewController = storyboard.instantiateViewController(withIdentifier: "AlbumViewController") as? AlbumViewController {
            navigationController?.pushViewController(albumViewController, animated: true)
        }
    }
}

