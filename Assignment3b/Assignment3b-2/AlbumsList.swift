//
//  AlbumsList.swift
//  Assignment3b-2
//
//  Created by Patrick Spafford on 7/28/20.
//  Copyright © 2020 Patrick Spafford. All rights reserved.
//

import Foundation

class AlbumsList: Codable {
    static var sharedAlbumsList = AlbumsList()
    private(set) var albums: [Album]
    let key = "key"
    
    init() {
        let defaults = UserDefaults.standard
        albums = [
                Album(artist: "Deftones", albumName: "White Pony", yearOfRelease: "2000", recordLabel: "Maverick Records",
                      tracks: [
                        Track(name: "Feiticeira"),
                        Track(name: "Digital Bath"), Track(name: "Elite"),
                        Track(name: "RX Queen")
                ]),
                Album(artist: "Deftones", albumName: "Koi No Yokan", yearOfRelease: "2012", recordLabel: "Reprise Records",
                      tracks: [
                        Track(name: "Swerve City"),
                        Track(name: "Romantic Dreams"),
                        Track(name: "Leathers")
                ]),
                Album(artist: "Deftones", albumName: "Gore", yearOfRelease: "2016", recordLabel: "Reprise Records",
                      tracks: [
                        Track(name: "Prayers/Triangles"),
                        Track(name: "Acid Hologram")
                ]),
                Album(artist: "Killswitch Engage", albumName: "Atonement", yearOfRelease: "2019", recordLabel: "Metal Blade Records",
                      tracks: [
                        Track(name: "Unleashed"),
                        Track(name: "The Signal Fire"),
                        Track(name: "Us Against the World")
                ]),
                Album(artist: "Killswitch Engage", albumName: "Disarm the Descent", yearOfRelease: "2013", recordLabel: "Wicked Good Studios",
                      tracks: [
                        Track(name: "The Hell In Me"),
                        Track(name: "Beyond the Flames"),
                        Track(name: "The New Awakening")
                ]),
                Album(artist: "Killswitch Engage", albumName: "The End of Heartache", yearOfRelease: "2004", recordLabel: "Roadrunner Records",
                      tracks: [
                        Track(name: "A Bid Farewell"),
                        Track(name: "Take This Oath"),
                        Track(name: "When Darkness Falls")
                ]),
                Album(artist: "Protest the Hero", albumName: "Palimpsest", yearOfRelease: "2020", recordLabel: "Protest the Hero Inc.",
                      tracks: [
                        Track(name: "The Migrant Mother"),
                        Track(name: "The Canary"),
                        Track(name: "From the Sky")
                ]),
                Album(artist: "Protest the Hero", albumName: "Volition", yearOfRelease: "2013", recordLabel: "Razor & Tie",
                      tracks: [
                        Track(name: "Clarity"),
                        Track(name: "Drumhead Trial")
                ]),
                Album(artist: "Trivium", albumName: "What the Dead Men Say", yearOfRelease: "2020", recordLabel: "Roadrunner Records",
                      tracks: [
                        Track(name: "IX"),
                        Track(name: "Catastrophist")
                ]),
                Album(artist: "Trivium", albumName: "The Sin and the Sentence", yearOfRelease: "2017", recordLabel: "Roadrunner Records",
                      tracks: [
                        Track(name: "Beyond Oblivion"),
                        Track(name: "The Sin and the Sentence"),
                        Track(name: "Other Worlds")
                ]),
                Album(artist: "Trivium", albumName: "Silence in the Snow", yearOfRelease: "2015", recordLabel: "Roadrunner Records",
                      tracks: [
                        Track(name: "Snowfall"),
                        Track(name: "Blind Leading the Blind")
                ]),
                Album(artist: "Mayday Parade", albumName: "A Lesson in Romantics", yearOfRelease: "2007", recordLabel: "Fearless Records",
                      tracks: [
                        Track(name: "Jamie All Over"),
                        Track(name: "Black Cat")
                ]),
        ]
        guard let albumData = defaults.object(forKey: key) as? Data else {
            print("Load albumData failed")
            return
        }
        guard let albumList = try? PropertyListDecoder().decode([Album].self, from: albumData) else {
            print("Property list decoder failed")
            return
        }
        albums = albumList
        
    }
    func addAlbum(album: Album) {
        let albumNames = AlbumsList.sharedAlbumsList.albums.map { $0.albumName }
        if !albumNames.contains(album.albumName) {
            albums.append(album)
            saveAlbums()
        }
    }
    func addTrack(album: Album, track: Track) {
        let albumNames = albums.map { $0.albumName}
        if albumNames.contains(album.albumName) {
            if let index = albumNames.firstIndex(of: album.albumName) {
            albums[index].tracks.append(track)
            }
        }
        saveAlbums()
    }
    func removeTrack(album: Album, track: Track) {
        let albumNames = albums.map { $0.albumName}
        if albumNames.contains(album.albumName) {
            if let index = albumNames.firstIndex(of: album.albumName) {
                let trackNames = albums[index].tracks.map { $0.name }
                if let trackDeletionIndex = trackNames.firstIndex(of: track.name) {
                    albums[index].tracks.remove(at: trackDeletionIndex)
                }
            }
        }
        saveAlbums()
        
    }
    func removeAlbum(album: Album) {
        let albumNames = albums.map { $0.albumName }
        if let index = albumNames.firstIndex(of: album.albumName) {
            AlbumsList.sharedAlbumsList.albums.remove(at: index)
            saveAlbums()
        }
    }
    func moveAlbum(fromIndex from: Int, toIndex to: Int) {
        let album = albums[from]
        albums.remove(at: from)
        albums.insert(album, at: to)
        saveAlbums()
    }
    private func saveAlbums() {
        let defaults = UserDefaults.standard
        defaults.set(try? PropertyListEncoder().encode(albums), forKey: key)
        // defaults.set(albums, forKey: "albums")
        defaults.synchronize()
    }
}
