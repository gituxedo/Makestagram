//
//  LoginViewController.swift
//  Makestagram
//
//  Created by apple on 6/22/17.
//  Copyright © 2017 Sylvia. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //extra setup
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //dump resources that can be recreated
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let authUI = FUIAuth.defaultAuthUI()
            else {return}
        authUI.delegate = self
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //get new view: segue.destinationViewController
    }
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
        }
        guard let user = user
            else {return}
        UserService.show(forUID: user.uid) {(user) in
            if let user = user {
                //handle existing user
                User.setCurrent(user, writeToUserDefaults: true)
                print("user already exists: \(user.username)")
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
            } else {
                //handle new user
                self.performSegue(withIdentifier: Constants.Segue.toCreateUsername, sender: self)
            }
        }
    }
}
