//
//  StorageService.swift
//  Makestagram
//
//  Created by apple on 6/26/17.
//  Copyright © 2017 Sylvia. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage
import Kingfisher

struct StorageService {
    static func uploadImage(_ image: UIImage, at reference: StorageReference, completion: @escaping (URL?) -> Void) {
        guard let imageData = UIImageJPEGRepresentation(image, 0.1) else {
            return completion(nil)
        }
        
        reference.putData(imageData, metadata: nil) { (metadata: StorageMetadata?, error: Error?) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            } else {
                completion(metadata?.downloadURL())
            }
        }
        
//        reference.putData(imageData, metadata: nil, completion: { (metadata, error) in
//
//        })
    }
}
