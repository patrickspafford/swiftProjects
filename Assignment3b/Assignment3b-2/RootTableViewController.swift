//
//  RootTableViewController.swift
//  Assignment3b-2
//
//  Created by Patrick Spafford on 7/28/20.
//  Copyright © 2020 Patrick Spafford. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {
    private var albums: [Album]!
    private static let albumCell = "AlbumName"
    private var cellPointSize = CGFloat(70)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = cellPointSize
        albums = AlbumsList.sharedAlbumsList.albums
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        albums = AlbumsList.sharedAlbumsList.albums
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RootTableViewController.albumCell, for: indexPath)
        cell.textLabel?.text = albums[indexPath.row].albumName
        cell.detailTextLabel?.text = albums[indexPath.row].artist
        cell.imageView?.image = UIImage(named: albums[indexPath.row].albumName)
        return cell
    }

   
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       let albumsList = AlbumsList.sharedAlbumsList
        if editingStyle == .delete {
            albumsList.removeAlbum(album: albums[indexPath.row] as Album)
            albums.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            
       }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "AddAlbum" {
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
            let listVC = segue.destination as! AlbumDetailViewController
            listVC.navigationItem.title = "Album"
            listVC.albumDetails = albums[indexPath.row]
        }
    

}
}
