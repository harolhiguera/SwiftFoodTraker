//
//  ViewController.swift
//  FoodTracker
//
//  Created by USER on 8/13/16.
//  Copyright © 2016 Harol. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,  UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
        
    }
    
    // MARK: UITextFieldDelegate
    
    //This method is part of the UITextFiedldDelegate protocol and it is call when user presses DONE btn
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        // Hides the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    //This method is also part of the UITextFieldDelegate protocol and it is call after Keyboard hides.
    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    // MARK: UIImagePickerCOntrolDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user is canceled
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // THe info dictionary contains multiple representations of the image, and this one uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageVire to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss th picker
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // MARK: Actions

    @IBAction func setDefaultLabelText(sender: UIButton) {
        
        mealNameLabel.text = "Hey! Default text!"
    }
    
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        
        //Hides the keyboard
        nameTextField.resignFirstResponder()
        
        //UIImagePockerController is a view controller that lets a user pick media from their photo library
        let imagePickerController = UIImagePickerController()
        //Only alloes photos to be picked, not taken
        imagePickerController.sourceType = .PhotoLibrary
        /*The type of imagePickerController.sourceType is known to be UIImagePickerControllerSourceType, which is an enumeration. This means you can write its value as the abbreviated form .PhotoLibrary instead of UIImagePickerControllerSourceType.PhotoLibrary. Recall that you can use the abbreviated form anytime the enumeration value’s type is already known.*/
        
        // Makes sure ViewController is notified when the user picks an image, sets the imagepickercontroller's delegate this class.
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    
}




