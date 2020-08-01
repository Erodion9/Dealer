//
//  ImagePickerManager.swift
//  Dealer
//
//  Created by Deniz Mavi on 1.08.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import Foundation
import UIKit


class ImagePickerManager: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private enum Constants {
        
        //Placeholders for future localisation
        static let chooseImage: String = "Choose Image"
        static let camera: String = "Camera"
        static let gallery: String = "Gallery"
        static let cancel: String = "Cancel"
        //Alert Warning
        static let warning: String = "Warning"
        static let warningMessage: String = "You don't have a camera"
        //Errors
        static let unexpectedTypeError: String = "Expected a dictionary containing an image, but was provided the following: "
    }

    var picker = UIImagePickerController();
    var alert = UIAlertController(title: Constants.chooseImage, message: nil, preferredStyle: .actionSheet)
    var viewController: UIViewController?
    var pickImageCallback : ((UIImage) -> ())?;

    override init(){
        super.init()
    }

    func pickImage(_ viewController: UIViewController, _ callback: @escaping ((UIImage) -> ())) {
        pickImageCallback = callback;
        self.viewController = viewController;

        let cameraAction = UIAlertAction(title: Constants.camera, style: .default){
            UIAlertAction in
            self.openCamera(viewController: viewController)
        }
        let galleryAction = UIAlertAction(title: Constants.gallery, style: .default){
            UIAlertAction in
            self.openGallery()
        }
        let cancelAction = UIAlertAction(title: Constants.cancel, style: .cancel){
            UIAlertAction in
        }

        // Add the actions
        picker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
        alert.popoverPresentationController?.sourceView = self.viewController!.view
        viewController.present(alert, animated: true, completion: nil)
    }
    func openCamera(viewController: UIViewController){
        alert.dismiss(animated: true, completion: nil)
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            self.viewController!.present(picker, animated: true, completion: nil)
        } else {
            let alertWarning = UIAlertController(title: Constants.warning, message: Constants.warningMessage, preferredStyle: .alert)
            alertWarning.addAction(UIAlertAction(title: Constants.cancel, style: .cancel, handler: { (action) in
                alertWarning.dismiss(animated: true, completion: nil)
            }))
            viewController.present(alertWarning, animated: true, completion: nil)
        }
    }
    func openGallery(){
        alert.dismiss(animated: true, completion: nil)
        picker.sourceType = .photoLibrary
        self.viewController!.present(picker, animated: true, completion: nil)
    }


    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError(Constants.unexpectedTypeError + "\(info)")
        }
        pickImageCallback?(image)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, pickedImage: UIImage?) {
    }

}
