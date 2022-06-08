//
//  MusicPlayerViewController.swift
//  Project 1 - FunZone
//
//  Created by Sevag Gaprielian on 2022-06-02.
//

import UIKit
import AVFoundation

class MusicPlayerViewController: UIViewController {
    @IBOutlet weak var musicImage: UIImageView!
    
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var songArtist: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var songTime: UILabel!
    @IBOutlet weak var songDuration: UILabel!
    
    static var audioPlayer : AVAudioPlayer?
    
    var count = 0
    var songFile : String?
    var timer : Timer?
    var currentSongTitle : String = " "
    var currentSongArtist : String = " "
    var currentSongImage : UIImage = UIImage(systemName: "music.quarternote.3")!
    var row : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playMusic()
    }
    
    struct minutesSeconds : CustomStringConvertible {
        var seconds = 0
        var minutes = 0
        
        var description: String {
            return NSString(format: "%02d:%02d", minutes, seconds) as String
        }
    }
    
    func songTimeFormatting(num : TimeInterval) -> String{
        let seconds = num
        var mins = 0
        var secs = seconds
        if (seconds >= 60){
            mins = Int(seconds/60)
            secs  = seconds - Double((mins*60))
        }
        return minutesSeconds(seconds: Int(secs), minutes: mins).description
    }
    
  
    func playMusic(){
        let filePath = Bundle.main.path(forResource: songFile, ofType: "mp3")
        let path = URL(fileURLWithPath: filePath!)

        do{
            MusicPlayerViewController.audioPlayer = try AVAudioPlayer(contentsOf: path)
        } catch {
            print("file not found")
        }
        
        songTitle.text = currentSongTitle
        songArtist.text = currentSongArtist
        musicImage.image = currentSongImage
        songTime.text = songTimeFormatting(num: MusicPlayerViewController.audioPlayer!.currentTime)
        songDuration.text = songTimeFormatting(num: MusicPlayerViewController.audioPlayer!.duration)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        MusicPlayerViewController.audioPlayer?.play()
    }
    
    @IBAction func playPause(_ sender: Any) {
        if(count == 0){
            MusicPlayerViewController.audioPlayer?.pause()
            count = 1
        } else {
            MusicPlayerViewController.audioPlayer?.play()
            count = 0
        }
    }
    
    @objc func updateTime(){
        let timeRemaining = MusicPlayerViewController.audioPlayer!.duration - MusicPlayerViewController.audioPlayer!.currentTime
        songTime.text = songTimeFormatting(num: MusicPlayerViewController.audioPlayer!.currentTime)
        songDuration.text = songTimeFormatting(num: timeRemaining)
        progressBar.progress = Float(MusicPlayerViewController.audioPlayer!.currentTime/MusicPlayerViewController.audioPlayer!.duration)
    }
    
    @IBAction func nextSong(_ sender: Any) {
        if(row != 4){
        songFile = MusicViewController.songs[row + 1].fileName
        currentSongTitle = MusicViewController.songs[row + 1].title
        currentSongArtist = MusicViewController.songs[row + 1].artist
        currentSongImage = UIImage(named: MusicViewController.songs[row + 1].image)!
        row = row + 1
        playMusic()
        } else {
            row = 0
            songFile = MusicViewController.songs[row].fileName
            currentSongTitle = MusicViewController.songs[row].title
            currentSongArtist = MusicViewController.songs[row].artist
            currentSongImage = UIImage(named: MusicViewController.songs[row].image)!
            playMusic()
        }
    }
    
    @IBAction func previousSong(_ sender: Any) {
        if(row != 0){
        songFile = MusicViewController.songs[row - 1].fileName
        currentSongTitle = MusicViewController.songs[row - 1].title
        currentSongArtist = MusicViewController.songs[row - 1].artist
        currentSongImage = UIImage(named: MusicViewController.songs[row - 1].image)!
        row = row - 1
        playMusic()
        } else {
            row = 4
            songFile = MusicViewController.songs[row].fileName
            currentSongTitle = MusicViewController.songs[row].title
            currentSongArtist = MusicViewController.songs[row].artist
            currentSongImage = UIImage(named: MusicViewController.songs[row].image)!
            playMusic()
        }
        
    }
    
}
