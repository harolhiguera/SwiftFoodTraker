//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Harol Higuera on 8/13/16.
//  Copyright © 2016 Harol. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate,  UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    /*
     This value is either passed by `MealTableViewController` in `prepareForSegue(_:sender:)`
     or constructed as part of adding a new meal.
     */
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
        
        // make sure the Save button is disabled until a user enters a valid name:
        checkValidMealName()
        
    }
    
    // MARK: UITextFieldDelegate Methods
    
    //This method gets called when an editing session begins, or when the keyboard gets displayed
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.enabled = false
    }
    
    func checkValidMealName() {
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    
    //This method is part of the UITextFiedldDelegate protocol and it is call when user presses DONE btn
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        // Hides the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    //This method is also part of the UITextFieldDelegate protocol and it is call after Keyboard hides.
    func textFieldDidEndEditing(textField: UITextField) {
        
        checkValidMealName()
        navigationItem.title = textField.text
        
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
    
    
    // MARK: NAvigation
    
    // This method lets you configure a view controller before it's presented.
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            
            //nil coalescing operator....An operator (??) placed between two values, a ?? b, that unwraps an optional a if it contains a value, or returns a default value b if a is nil.
        
            
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            // Set the meal to be passed to MealTableViewController after the unwind segue.
            meal = Meal(name: name, photo: photo, rating: rating)
        }
    }
    
    
    @IBAction func Cancel(sender: UIBarButtonItem) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // MARK: Actions

    
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




