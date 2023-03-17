//
//  SignupViewController.swift
//  BuyTheWay
//
//  Created by Mac on 3/14/23.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import Firebase

class SignupViewController: UIViewController {
    
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.layer.cornerRadius = 10
        
        
    }
  
    
    
    @IBAction func alreadyHaveAnAccountButtonTapped (_ sender:Any){
        
        if let nextVC = storyboard?.instantiateViewController(withIdentifier: "loginScreenVC"){
            nextVC.modalPresentationStyle = .fullScreen
            present(nextVC, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func googleButtonTapped (_ sender:Any){
        
            let screenBounds = UIScreen.main.bounds
            let loadingView = UIView(frame: CGRect(x: 0, y: 0, width: screenBounds.width, height: screenBounds.height))
            loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            loadingView.clipsToBounds = true
            loadingView.layer.cornerRadius = 10
            let activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.center = loadingView.center
            loadingView.addSubview(activityIndicator)
            
            
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            
            // Create Google Sign In configuration object.
            let config = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.configuration = config
            
            // Start the sign in flow!
            GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
                guard error == nil else {
                    return
                }
                
                guard let user = result?.user,
                      let idToken = user.idToken?.tokenString
                else {
                    return
                }
                
                view.addSubview(loadingView)
                activityIndicator.startAnimating()
                
                let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                               accessToken: user.accessToken.tokenString)
                Auth.auth().signIn(with: credential) { result, error in
                    
                    // At this point, our user is signed in
                    
                    if error != nil {
                        loadingView.removeFromSuperview()
                        activityIndicator.stopAnimating()
                        
                    }else {
                     print("Error")
                        
                    }
                }
            }

    }
}
