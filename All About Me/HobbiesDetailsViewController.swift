//
//  HobbiesDetailsViewController.swift
//  All About Me
//
//  Created by Student on 7/16/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
var hobbyIndex:Int?
class HobbiesDetailsViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var hobbyImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func chooseImageButton(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum)){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated:true, completion:nil)
            
        }
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        self.dismiss(animated: true,completion: nil)
    }
        func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMedLawWithInfo info: [UIImagePickerController.InfoKey : Any]){
            self.dismiss(animated: true, completion: nil)
                let image = info[.originalImage] as? UIImage
                hobbyImage.image = image
            hobbyList[hobbyIndex!].imageName = image
            }




}// END OF A CLASS
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


