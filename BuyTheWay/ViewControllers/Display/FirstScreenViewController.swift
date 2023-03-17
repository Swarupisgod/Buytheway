//
//  FirstScreenViewController.swift
//  BuyTheWay
//
//  Created by Mac on 3/14/23.
//

import UIKit

class FirstScreenViewController: UIViewController {

    @IBOutlet var getStartedButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        getStartedButton.layer.cornerRadius = 8
        
//        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
//               if launchedBefore  {
//                   // App has been launched before
//                   // Hide the "Get Started" button
//                   getStartedButton.isHidden = true
//               } else {
//                   // First time app launch
//                   // Show the "Get Started" button
//                   getStartedButton.isHidden = false
//                   
//                   // Save the launchedBefore flag to UserDefaults
//                   UserDefaults.standard.set(true, forKey: "launchedBefore")
//               }

    }
    

    @IBAction func getStartedButtonTapped(_ sender: Any) {
        if let nextVC = storyboard?.instantiateViewController(withIdentifier: "secondScreenVC") {
            nextVC.modalPresentationStyle = .fullScreen
            present(nextVC, animated: true, completion: nil)
        }
    }
    

}
