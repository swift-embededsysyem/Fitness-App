//
//  FirstViewController.swift
//  fitnessApp
//
//  Created by akbar  Rizvi on 1/21/19.
//  Copyright © 2019 akbar  Rizvi. All rights reserved.
//


import UIKit
import Social
class FirstViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIDocumentInteractionControllerDelegate {
    let imagePicker = UIImagePickerController()
    var imgPicked = false
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var dailyBountyLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var totallRepsDone: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
    }
    @IBAction func workOutButton(_ sender: UIButton) {
        
        
    }
    
 
    
    @IBAction func twitterClicked(_ sender: UIButton) {
        openImgPicker()
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter) {
           
                share(vc: vc)
            }
        
    }
    @IBAction func instagramClicked(_ sender: UIButton) {
        
        openImgPicker()
  /*
    let instagramUrl = URL(string: "instagram://app")
        if (UIApplication.shared.canOpenURL(instagramUrl!)) {
            let imageData = UIImage.provideImageData.image!,100)
            //(profileImageView.image!,100)
        }
      */
        
    }
    @IBAction func facebookClicked(_ sender: UIButton) {
         openImgPicker()
       
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
            share(vc:vc)
        }
       
        
    }
    func imageSharingComplete() {
        
        imgPicked = false
    }
    
    func share (vc:SLComposeViewController) {
        vc.setInitialText(totallRepsDone.text)
        if let img = profileImageView.image {

        vc.add(img)
            // vc.add (url:URL!)
    }
       present(vc, animated: true, completion: nil)
       imageSharingComplete()
    }
    
    
    
    func openImgPicker (){
        
        if !imgPicked {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        imgPicked = true
        
        
    }
    
}
// image picker return
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage]
        as? UIImage {
            profileImageView.image = pickedImage
            self.dismiss(animated: true, completion: nil)
        }
    }

}
