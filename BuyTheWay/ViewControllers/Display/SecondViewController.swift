//
//  SecondViewController.swift
//  BuyTheWay
//
//  Created by Mac on 3/16/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var signupButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 8
        signupButton.layer.cornerRadius = 8   
      
    }
    

    @IBAction func loginButtonTapped(_ sender: Any) {
        if let nextVC = storyboard?.instantiateViewController(withIdentifier: "loginScreenVC") {
            nextVC.modalPresentationStyle = .fullScreen
            present(nextVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        if let nextVC = storyboard?.instantiateViewController(withIdentifier: "signUpScreenVC") {
            nextVC.modalPresentationStyle = .fullScreen
            present(nextVC, animated: true, completion: nil)
        }
    }
}
