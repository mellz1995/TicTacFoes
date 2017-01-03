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
        
        let testObject = PFObject(className: "Test Object 2")
        testObject["foo"] = "bar"
        testObject.saveInBackground { (success, error) -> Void in
            print("Object has been saved")
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
