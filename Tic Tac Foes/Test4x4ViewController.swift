//
//  Test4x4ViewController.swift
//  Tic Tac Foes
//
//  Created by Melvin Corners on 12/31/16.
//  Copyright © 2016 ChrisApps. All rights reserved.
//

import UIKit
import AVFoundation

class Test4x4ViewController: UIViewController {
    
    //Plays sound when a button is pressed
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
    
    //Gameplay Music
    var battleMusic: AVAudioPlayer? = {
        guard let url = Bundle.main.url(forResource: "Splatter", withExtension: "mp3") else {
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
    
    //1 is noughts, 2 is crosses
    var activePlayer = 1
    
    // 0 = empty, 1 = naughts, 2 = crosses
    //Notice there are 16 0s to comidate for 16 spaces
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var activeGame = true
    
    //Winning Combinations
    let winningCombinations = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15], [0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15], [0, 5, 10, 15], [3, 6, 9, 12]]
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        buttonPressedSound?.play()
        print(sender.tag)
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame{
            gameState[activePosition] = activePlayer
            
            if activePlayer == 1{
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
            }
                
            else {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }
    }
}
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        battleMusic?.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
