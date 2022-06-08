//
//  MusicViewController.swift
//  Project 1 - FunZone
//
//  Created by Sevag Gaprielian on 2022-05-25.
//

import UIKit

class MusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    class Song {
        var title : String
        var artist : String
        var fileName : String
        var image : String
        
        init(title : String, artist : String, fileName : String, image : String ){
            self.title = title
            self.artist = artist
            self.fileName = fileName
            self.image = image
        }
    }
    
    static var songs = [Song]()
    
    func addSongs(){
        MusicViewController.songs = []
        MusicViewController.songs.append(Song.init(title: "SloMo", artist: "Chanel", fileName: "Chanel - SloMo", image:"Chanel - SloMo"))
        MusicViewController.songs.append(Song.init(title: "Paper Rings", artist: "Taylor Swift", fileName: "Taylor Swift - Paper Rings", image: "Taylor Swift - Paper Rings"))
        MusicViewController.songs.append(Song.init(title: "Save Your Tears (with Ariana Grande) (Remix)", artist: "The Weeknd, Ariana Grande", fileName: "The Weeknd, Ariana Grande - Save Your Tears (with Ariana Grande) (Remix)", image: "The Weeknd, Ariana Grande - Save Your Tears (with Ariana Grande) (Remix)"))
        MusicViewController.songs.append(Song.init(title: "Party in the U.S.A.", artist: "Miley Cyrus", fileName: "Miley Cyrus - Party in the U.S.A.", image: "Miley Cyrus - Party in the U.S.A."))
        MusicViewController.songs.append(Song.init(title: "Feel Special", artist: "TWICE", fileName: "TWICE - The Feels", image: "TWICE - The Feels"))
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        MusicPlayerViewController.audioPlayer?.stop()
        addSongs()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MusicViewController.songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let mycell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MusicTableViewCell
        
        mycell.songLabel.text = MusicViewController.songs[indexPath.row].title
        mycell.artistLabel.text = MusicViewController.songs[indexPath.row].artist
        mycell.songThumbnail.image = UIImage(named: MusicViewController.songs[indexPath.row].image)
        
        return mycell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(MusicViewController.songs[indexPath.row].fileName)

        let musicPlayer = storyboard?.instantiateViewController(withIdentifier: "musicPlayer") as! MusicPlayerViewController
        musicPlayer.songFile = MusicViewController.songs[indexPath.row].fileName
        musicPlayer.currentSongTitle = MusicViewController.songs[indexPath.row].title
        musicPlayer.currentSongArtist = MusicViewController.songs[indexPath.row].artist
        musicPlayer.currentSongImage = UIImage(named: MusicViewController.songs[indexPath.row].image)!
        musicPlayer.row = indexPath.row
        navigationController?.pushViewController(musicPlayer, animated: true)
        
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
