//
//  AddTrackViewController.swift
//  Assignment3b-2
//
//  Created by Patrick Spafford on 7/29/20.
//  Copyright © 2020 Patrick Spafford. All rights reserved.
//

import UIKit

class AddTrackViewController: UIViewController {
    @IBOutlet weak var trackName: UITextField!
    @IBOutlet weak var duration: UITextField!
    var albumDetails: Album!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func addTrack(_ sender: Any) {
        if !trackName.text!.isEmpty && !duration.text!.isEmpty {
            let trackToAdd = Track(name: trackName.text ?? "Default Track Name", duration: duration.text ?? "0:00")
            AlbumsList.sharedAlbumsList.addTrack(album: albumDetails, track: trackToAdd)
            albumDetails.tracks.append(trackToAdd)
        }
    }
    
}
