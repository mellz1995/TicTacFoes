//
//  MainMenu.swift
//  Tic Tac Foes
//
//  Created by Christopher Donelson on 12/30/16.
//  Copyright © 2016 ChrisApps. All rights reserved.
//

import UIKit
import AVFoundation

class MainMenu: UIViewController {
    
    var buttonPressedSound: AVAudioPlayer? = {
        guard let url = Bundle.main.url(forResource: "MBC", withExtension: "mp3") else {
            return nil
        }
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = 0
            return player
        } catch {
            return nil
        }
    }()
    
    @IBAction func SinglePlayerButtonAction(_ sender: Any) {
        buttonPressedSound?.play()
    }
    
    
    
    
    var mainMenuMusic: AVAudioPlayer? = {
        guard let url = Bundle.main.url(forResource: "Oh yeah", withExtension: "mp3") else {
            return nil
        }
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = -1
            return player
        } catch {
            return nil
        }
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mainMenuMusic?.play()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

