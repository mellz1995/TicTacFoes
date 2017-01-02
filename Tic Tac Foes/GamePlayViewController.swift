//
//  GamePlayViewController.swift
//  Tic Tac Foes
//
//  Created by Melvin Corners on 1/1/17.
//  Copyright © 2017 ChrisApps. All rights reserved.
//

import UIKit
import AVFoundation

class GamePlayViewController: UIViewController {
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
    var gameState = [0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0]
    
    var activeGame = true
    
    let winningCombinations = [ [0,  1,  2,  3],  [1,  2,  3,  4],  [2,  3,  4,  5],   //side by side wins
                                [6,  7,  8,  9],  [7,  8,  9,  10], [8,  9,  10, 11],
                                [12, 13, 14, 15], [13, 14, 15, 16], [14, 15, 16, 17],
                                [18, 19, 20, 21], [19, 20, 21, 22], [20, 21, 22, 23],
                                [24, 25, 26, 27], [25, 26, 27, 28], [26, 27, 28, 29],
                                [30, 31, 32, 33], [31, 32, 33, 34], [32, 33, 34, 35],
    
                                [0, 6, 12, 18], [6, 12, 18, 24], [12, 18, 24, 30],      //straight down wins
                                [1, 7, 13, 19], [7, 13, 19, 25], [13, 19, 25, 31],
                                [2, 8, 14, 20], [8, 14, 20, 26], [14, 20, 26, 32],
                                [3, 9, 15, 21], [9, 15, 21, 27], [15, 21, 27, 33],
                                [4, 10, 16, 22], [10, 16, 22, 28], [16, 22, 28, 34],
                                [5, 11, 17, 23], [11, 17, 23, 29], [17, 23, 29, 35],
    
                                [0, 7, 14, 21], [1, 8, 15, 22], [2, 9, 16, 23],         //backslash diagonal wins
                                [6, 13, 20, 27], [7, 14, 21, 28], [8, 15, 22, 29],
                                [12, 19, 26, 33], [13, 20, 27, 34], [14, 21, 28, 35],
        
                                [3, 8, 13, 18], [4, 9, 14, 19], [5, 10, 15, 20],        //forwardslash diagonal wins
                                [9, 14, 19, 24], [10, 15, 20, 25], [11, 16, 21, 26],
                                [15, 20, 25, 30], [16, 21, 26, 31], [17, 22, 27, 32]
    ]
    
    @IBOutlet weak var winnerLabel: UILabel!
   // @IBOutlet weak var playAgainButton: UIButton!
    /*
    @IBAction func playAgain(_ sender: AnyObject) {
        activeGame = true
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0, 0]
        var _: UIButton
        
        for i in 1..<10{
            if let button = view.viewWithTag(i) as? UIButton{
                button.setImage(nil, for: [])
            }
        }
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        
    }
    */
    @IBAction func buttonPressed(_ sender: AnyObject) {
        buttonPressedSound?.play()
        
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
            //print(sender.tag)
            for combination in winningCombinations{
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] && gameState[combination[2]] == gameState[combination[3]]{
                    
                    //We have a winner!
                    activeGame = false
                    winnerLabel.isHidden = false
                    //playAgainButton.isHidden = false
                    
                    if gameState[combination[0]] == 1{
                        winnerLabel.text = "Noughts has won!"
                    }
                        
                    else {
                        winnerLabel.text = "Crosses has won!"
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        //self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                    })
                }
            }
        }
    }
    
    @IBAction func mainMenuButton(_ sender: AnyObject) {
            battleMusic?.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        winnerLabel.isHidden = true
        //playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        //playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        
        //Play battleMusic
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