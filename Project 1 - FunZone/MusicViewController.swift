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
        
        init(title : String, artist : String){
            self.title = title
            self.artist = artist
        }
    }
    
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        songs.append(Song.init(title: "SloMo", artist: "Chanel"))
        songs.append(Song.init(title: "Want Me", artist: "Baby Queen"))
        songs.append(Song.init(title: "Material Girl", artist: "Madonna"))
        songs.append(Song.init(title: "Clearest Blue", artist: "Churches"))
        songs.append(Song.init(title: "Starships", artist: "Nicki Minaj"))
        songs.append(Song.init(title: "Party in the USA", artist: "Miley Cyrus"))

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let mycell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MusicTableViewCell
        
        mycell.songLabel.text = songs[indexPath.row].title
        mycell.artistLabel.text = songs[indexPath.row].artist
        
        return mycell
        
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
