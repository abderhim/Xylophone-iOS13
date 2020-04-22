//
//  ViewController.swift
//  Xylophone/Users/abderhimbensaid/Desktop/Xylophone-iOS13/Xylophone/ViewController.swift
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation




class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func KeyPassed(_ sender: UIButton) {
        
        let seconds = 0.2
       DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        self.playSound(music: "C")
            sender.alpha=1
           // Put your code which should be executed with a delay here
      
        }
        sender.alpha=0.5
    
        
    }
    
    
  
    @IBAction func KeyPressedD(_ sender: UIButton) {
        
          playSound(music: "D")
    }
    
    
    
    @IBAction func KeyPressedE(_ sender: UIButton) {
        
        playSound(music: "E")
    }
    
    
    
    @IBAction func KeyPressedF(_ sender: UIButton) {
         playSound(music: "F")
        do {
            sleep(2)
            sender.alpha=0.5
        }
        
        sender.alpha=1
    }
    
    
    @IBAction func KeyPressedG(_ sender: UIButton) {
        
        playSound(music: "G")
    }
    
    
    @IBAction func KeyPressedA(_ sender: UIButton) {
        
        playSound(music:"A")
        
    }
    
    
    @IBAction func UIButtonB(_ sender: UIButton) {
        playSound(music: "B")
    }
    
    
    
    
    func playSound( music: String) {
          guard let url = Bundle.main.url(forResource: music, withExtension: "wav") else { return }
          
          do {
              try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
              try AVAudioSession.sharedInstance().setActive(true)
              
              /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
              player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
              
              /* iOS 10 and earlier require the following line:
               player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
              
              guard let player = player else { return }
              
              player.play()
              
          } catch let error {
              print(error.localizedDescription)
          }
      }
      
  

    
}

