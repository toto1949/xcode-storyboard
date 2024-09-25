//
//  AlbumViewCoontroller.swift
//  DisplayDataUsingUICollection
//
//  Created by Taooufiq El moutaoouakil on 9/23/24.
//

import UIKit

class AlbumViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var albums: [AlbumModel] = []
    var albumViewModel = AlbumViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.dataSource = self
        collectionView?.delegate = self

        loadData()
    }

    func loadData() {
        Task {
            if let data = await self.albumViewModel.fetchDataFromAPITrade() {
                DispatchQueue.main.async {
                    self.albums = data
                    self.collectionView?.reloadData()
                    print("\(data)")
                }
            } else {
                print("Failed to fetch data")
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumSection", for: indexPath) as! AlbumSection

        let album = albums[indexPath.item]
        cell.id.text = "\(album.id)"
        cell.title.text = album.title

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width / 2) - 10
        return CGSize(width: width, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
