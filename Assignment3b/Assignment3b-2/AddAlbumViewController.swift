//
//  AddAlbumViewController.swift
//  Assignment3b-2
//
//  Created by Patrick Spafford on 7/29/20.
//  Copyright © 2020 Patrick Spafford. All rights reserved.
//

import UIKit

class AddAlbumViewController: UIViewController {

    @IBOutlet weak var albumTitleField: UITextField!
    @IBOutlet weak var artistField: UITextField!
    @IBOutlet weak var studioField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addAlbum(_ sender: Any) {
        if !albumTitleField.text!.isEmpty &&
            !artistField.text!.isEmpty && !studioField.text!.isEmpty {
            let newAlbum = Album(artist: artistField.text ?? "Artist" , albumName: albumTitleField.text ?? "Title", yearOfRelease: yearField.text ?? "1900", recordLabel: studioField.text ?? "Studio", tracks: [Track(name: "Track 1")])
            AlbumsList.sharedAlbumsList.addAlbum(album: newAlbum)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
