//
//  CreateUsernameViewController.swift
//  Makestagram
//
//  Created by apple on 6/23/17.
//  Copyright © 2017 Sylvia. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let firUser = Auth.auth().currentUser,
            let username = usernameTextField.text,
            !username.isEmpty else { return }
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else { return }
            User.setCurrent(user, writeToUserDefaults: true)
            print("Created new user: \(user.username)")
            let initialViewController = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
    }
}
