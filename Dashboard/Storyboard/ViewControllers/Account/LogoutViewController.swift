//
//  LogoutViewController.swift
//  BuyTheWay
//
//  Created by Mac on 3/14/23.
//

import UIKit
import FirebaseAuth

class LogoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Are you sure you want to delete your account?", message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            // Send request for account deletion here
            let confirmationAlertController = UIAlertController(title: "Request for account deletion has been sent", message: nil, preferredStyle: .alert)
            let okConfirmationAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            confirmationAlertController.addAction(okConfirmationAction)
            self.present(confirmationAlertController, animated: true, completion: nil)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let logoutAction = UIAlertAction(title: "Logout", style: .destructive) { (_) in
            
            let loadingView = UIView(frame: self.view.bounds)
                    loadingView.backgroundColor = UIColor(white: 0, alpha: 0.5)
                    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
                    label.center = loadingView.center
                    label.textAlignment = .center
                    label.text = "Logging out..."
                    label.textColor = .white
                    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
                    loadingView.addSubview(label)
                    self.view.addSubview(loadingView)
            
            
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                // Navigate to LoginViewController
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginVC = storyboard.instantiateViewController(withIdentifier: "loginScreenVC") as! LoginViewController
                UIApplication.shared.windows.first?.rootViewController = loginVC
                UIApplication.shared.windows.first?.makeKeyAndVisible()
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                       loadingView.removeFromSuperview()
                   }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(logoutAction)
        present(alertController, animated: true, completion: nil)
    }

    


}
