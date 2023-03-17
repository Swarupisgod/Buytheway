//
//  LoginViewController.swift
//  BuyTheWay
//
//  Created by Mac on 3/14/23.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 8
        emailTextField.delegate = self
        passwordTextField.delegate = self

        

        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
          return true
      }

  
    @IBAction func loginButtonTapped(_ sender: Any) {
        let screenBounds = UIScreen.main.bounds
        let loadingView = UIView(frame: CGRect(x: 0, y: 0, width: screenBounds.width, height: screenBounds.height))
        loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = loadingView.center
        loadingView.addSubview(activityIndicator)
        
        
        // RETURN BUTTON CLOSES THE KEYBOARD
        if emailTextField.isFirstResponder {
            emailTextField.resignFirstResponder()
        } else if passwordTextField.isFirstResponder {
            passwordTextField.resignFirstResponder()
        }
        
        // CLEANED VERSION
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        view.addSubview(loadingView)
        activityIndicator.startAnimating()
        
        
        // LOGGING IN
        Auth.auth().signIn(withEmail: email, password: password) {
            (result,error) in
             if error != nil {
                loadingView.removeFromSuperview()
                activityIndicator.stopAnimating()
                self.showMessage(title: "Invalid", message: "Please enter a valid email or password")
              
            }
            else {
                let storyboard = UIStoryboard(name: "Home", bundle:Bundle.main)
                let vc = storyboard.instantiateViewController(withIdentifier: "TabVC")
//                        self.show(vc, sender: self)
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                loadingView.removeFromSuperview()
                activityIndicator.stopAnimating()
                 
//                print("Error")
            }
        }
        
        
    }
    
    func showMessage(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func dontHaveAnAccountButtonTapped(_ sender: Any) {
        if let nextVC = storyboard?.instantiateViewController(withIdentifier: "signUpScreenVC") {
            nextVC.modalPresentationStyle = .fullScreen
            present(nextVC, animated: true, completion: nil)
        }
        
    }
}
