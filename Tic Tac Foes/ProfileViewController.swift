//
//  ProfileViewController.swift
//  Tic Tac Foes
//
//  Created by Melvin Corners on 1/2/17.
//  Copyright © 2017 ChrisApps. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Basic Code for adding a user
//        let user = PFObject(className: "Users")
//        user["name"] = "Melvin"
//        user.saveInBackground { (success, error) in
//            if success {
//                print("Object saved")
//            }
//            
//            else{
//                if let error = error{
//                    print(error)
//                }
//                
//                else {
//                    print(error!)
//                }
//            }
//        }
        
        let query = PFQuery(className: "Users")
        query.getObjectInBackground(withId: "AFoO7HqEF6") {( object, error) in
        
            if error != nil {
                print (error!)
            } else {
                if let user = object {
                    user["name"] = "Kristen"
                    
                    user.saveInBackground(block: { (success, error) in
                        
                        if success {
                            print("Saved")
                        } else {
                            print("Error")
                        }
                    })
                }
            }
        }
        
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
