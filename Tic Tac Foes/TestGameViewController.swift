//
//  TestGameViewController.swift
//  Tic Tac Foes
//
//  Created by Melvin Corners on 12/30/16.
//  Copyright © 2016 ChrisApps. All rights reserved.
//

import UIKit
import AVFoundation

class TestGameViewController: UIViewController {
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
    
    //1 is noughts, 2 is crosses
    var activePlayer = 1
    
    // 0 = empty, 1 = naughts, 2 = crosses
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var activeGame = true
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: AnyObject) {
        activeGame = true
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
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
                    if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                        
                        //We have a winner!
                        activeGame = false
                        winnerLabel.isHidden = false
                        playAgainButton.isHidden = false
                        
                        if gameState[combination[0]] == 1{
                            winnerLabel.text = "Noughts has won!"
                        }
                        
                        else {
                            winnerLabel.text = "Crosses has won!"
                        }
                        
                        UIView.animate(withDuration: 1, animations: {
                            self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                            self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                        })
                    }
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
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
