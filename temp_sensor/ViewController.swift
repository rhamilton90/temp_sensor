//
//  ViewController.swift
//  temp_sensor
//
//  Created by HamiltonMac on 9/28/16.
//  Copyright © 2016 HamiltonMac. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {

    @IBOutlet weak var TempBtn: CustomButton!
    @IBOutlet weak var TempLabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var errMsg: UILabel!
  
    
    var tempchild = "TempData"
    var FirebaseRef: FIRDatabaseReference!
    //let degree = "\u{00B0}"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.FirebaseRef = FIRDatabase.database().reference()
        
        fetchTemp() // This will atempt to fetch a value when view loads
    }

    @IBAction func onButtonTapped(_ sender: AnyObject) {
        fetchTemp()
        print("Fetch Temp Executed")
    }
    
    func fetchTemp(){
        // [START single_value_read]
        FirebaseRef.observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            if let value = snapshot.value as? NSDictionary {
                print(value)
                self.TempLabel.text = "\(value["Temperature"]!)\u{00B0}F"
                self.TimeLabel.text = "Updated: \(value["TempTime"]!)"
            } else {
                self.TempLabel.isHidden = true
                self.TimeLabel.isHidden = true
                self.errMsg.isHidden = false
            }
        }) { (error) in
            print(error.localizedDescription)
            
        }
        // [END single_value_read]

    }
    
    

}

