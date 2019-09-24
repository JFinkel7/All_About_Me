//
//  HobbyDetailsViewController.swift
//  All About Me
//
//  Created by Student on 7/16/19.
//  Copyright © 2019 Student. All rights reserved.
//*
import UIKit
import MapKit
import Foundation
//*
class HobbyDetailsViewController{
    
    @IBAction func chooseImageButton(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum)){
          let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated:true, completion:nil)
            
        }
    }
    
    
}// END OF CLASS
