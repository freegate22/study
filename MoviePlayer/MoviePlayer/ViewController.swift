//
//  ViewController.swift
//  MoviePlayer
//
//  Created by na on 2016. 10. 31..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        let filePath:String? = Bundle.main.path(forResource: "FastTyping",ofType:"mp4")
        let url = URL(fileURLWithPath: filePath!)
        playVideo(url: url)
    }

    @IBAction func btnPlayExternalMovie(_ sender: UIButton) {
        let url = URL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")!
        playVideo(url: url)
    }
    
    private func playVideo(url: URL){
        let player = AVPlayer(url: url)
        let playerController = AVPlayerViewController()
        
        playerController.player = player
        self.present(playerController, animated:true){
            player.play()
        }
    }
}

