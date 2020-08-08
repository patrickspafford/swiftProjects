//
//  AlbumDetailViewController.swift
//  Assignment3b-2
//
//  Created by Patrick Spafford on 7/28/20.
//  Copyright © 2020 Patrick Spafford. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var studioLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var albumDetails: Album!
    private static let albumDetailKey = "AlbumDetailKey"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumDetails.tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: AlbumDetailViewController.albumDetailKey)
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: AlbumDetailViewController.albumDetailKey)
        }
        cell?.textLabel?.text = albumDetails.tracks[indexPath.row].name
        cell?.detailTextLabel?.text = albumDetails.tracks[indexPath.row].duration
        return cell!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        albumTitleLabel.text = albumDetails.albumName
        artistLabel.text = "By: \(albumDetails.artist)"
        releaseLabel.text = "Released: \(albumDetails.yearOfRelease)"
        studioLabel.text = albumDetails.recordLabel
        
        albumImage.image = UIImage(named: albumDetails.albumName)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let albumNames = AlbumsList.sharedAlbumsList.albums.map { $0.albumName}
        if let index = albumNames.firstIndex(of: albumDetails.albumName) {
        albumDetails = AlbumsList.sharedAlbumsList.albums[index]
        }
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let albumsList = AlbumsList.sharedAlbumsList
        if editingStyle == .delete {
            albumsList.removeTrack(album: albumDetails, track: albumDetails.tracks[indexPath.row])
            albumDetails.tracks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addTrackVC = segue.destination as! AddTrackViewController
        addTrackVC.navigationItem.title = albumDetails.albumName
        addTrackVC.albumDetails = albumDetails
    }
   

}
