//
//  MainTabBarController.swift
//  Makestagram
//
//  Created by apple on 6/26/17.
//  Copyright © 2017 Sylvia. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    let photoHelper = MGPhotoHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoHelper.completionHandler = { image in
            PostService.create(for: image)
            print("handle image")
        }
        delegate = self
        tabBar.unselectedItemTintColor = .black
    }
}


extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 1 {
            print("take photo")
            photoHelper.presentActionSheet(from: self)
            return false
        } else {
            return true
        }
    }
}
