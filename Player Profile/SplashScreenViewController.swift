//
//  SplashScreenViewController.swift
//  Player Profile
//
//  Created by Jack Fenton on 5/1/22.
//

import UIKit
import AVFoundation

class SplashScreenViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(name: "crowdsound")
    }
    
    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        } else {
            print("Error: Could not read data from file")
        }
    }

    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        if audioPlayer != nil {
            audioPlayer.stop()
        }
        performSegue(withIdentifier: "ShowTableView", sender: nil)
    }
}
